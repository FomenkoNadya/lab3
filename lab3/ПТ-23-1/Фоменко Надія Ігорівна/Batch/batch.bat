chcp 65001 > nul
mkdir "hidden folder"
mkdir "Not hidden folder"
attrib +h "hidden folder"
cd "Not hidden folder"
help xcopy > copyhelp.txt 
xcopy /c copyhelp.txt ..\"hidden folder"\copied_copyhelp.txt