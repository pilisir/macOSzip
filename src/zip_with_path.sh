# Version 1.2
# Copyright (c) 2019 pilisir.tw@gmail.com
# Under MIT Licesne, please go to "https://en.wikipedia.org/wiki/MIT_License" to check license terms.

zipFileName=""
eachFileName=""
destDir="/Documents/"
cd $HOME
while read -r eachItemPath;
do
	if [ -z $zipFileName ]; then
		zipFileName=`basename "$eachItemPath"` 
	fi
	eachFileName=${eachItemPath/$HOME\//""}
	if [[ ($eachItemPath =~ "$HOME$destDir") && (${eachItemPath:0:7} = \/Users\/) ]]; then
		cd $HOME$destDir
		eachFileName=${eachFileName/${destDir:1:${#destDir}-1}/""}
	fi
	zip -r "$HOME$destDir$zipFileName.zip" "$eachFileName" -x "*/\__MACOSX" -x "*.DS_Store"
done