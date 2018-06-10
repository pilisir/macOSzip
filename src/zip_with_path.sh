# Version 0.1
# Copyright (c) 2018 pilisir.tw@gmail.com
# Under MIT Licesne, please go to "https://en.wikipedia.org/wiki/MIT_License" to check license terms.

zipFileName=""
eachFileName=""
zipFileDir=""
for eachItemPath in "$@" 
do
	eachFileName=`basename "$eachItemPath"` 
	if [ -z $zipFileName ]; then
		zipFileName=$eachFileName
	fi
	if [ -d $eachItemPath ]; then
		zipFileDir=$eachItemPath
		cd $zipFileDir
		cd ../
	else
		zipFileDir=`dirname "$eachItemPath"` 
		cd $zipFileDir
	fi
	zip -r "$zipFileName.zip" "$eachFileName" -x "*/\__MACOSX" -x "*/\.*"
done