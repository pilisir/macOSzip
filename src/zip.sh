# Version 1.2
# Copyright (c) 2019 pilisir.tw@gmail.com
# Under MIT Licesne, please go to "https://en.wikipedia.org/wiki/MIT_License" to check license terms.

escapePath() {
	resultValue=$(echo "$@" | sed 's@[\]@\\\\@g;s/"/\\"/g;s/\ /\\ /g;s/'"'"'/\'"\'"'/g;s/`/\\`/g;s/:/\\:/g;s/?/\\?/g;s/!/\\!/g;s/</\\</g;s/>/\\>/g;s/|/\\|/g;s/*/\\*/g;s/(/\\(/g;s/)/\\)/g;s/\[/\\[/g;s/\]/\\]/g;s/{/\\{/g;s/}/\\}/g;s/&/\\&/g;s/%/\\%/g;s/\$/\\$/g;s/#/\\#/g;s/~/\\~/g;s/=/\\=/g;s/,/\\,/g;s@[;]@\\;@g;')
	echo $resultValue
}

zipFileName=""
eachFileName=""
zipFileDir=""
while read -r eachItemPath;
do
	eachItemPathEscape=$(escapePath "$eachItemPath")
	eachFileName=$(basename "$eachItemPathEscape")
	if [ -z $zipFileName ]; then
		zipFileName=$eachFileName
	fi
	if [ -d $eachItemPath ]; then
		zipFileDir=$eachItemPathEscape
		cmd="cd $zipFileDir"
		eval $cmd
		cd ../
	else
		zipFileDir=$(dirname "$eachItemPathEscape") 
		cmd="cd $zipFileDir"
		eval $cmd
	fi
	cmd="zip -x */\__MACOSX -x *.DS_Store -r ./$zipFileName.zip -- $eachFileName"
	eval $cmd
done