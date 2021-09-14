#!/bin/bash

### Deletion of temp_activity directory if pre-exists - TESTING PURPOSE
# [ -e temp_activity ] && rm -R temp_activity

### Creating a directory temp_activity and navigating to it.
if [ ! -d temp_activity ];
then
    mkdir temp_activity
fi
cd temp_activity


### Creating files temp<i>.txt, substitute <i> with numbers from 1 to 50. 
touch temp{1..50}.txt

### Command to change the extensions of files from temp1 to temp25 from txt to md.
for i in {1..25}
do
    mv temp${i}.txt temp${i}.md
done

### Command to change the file name from temp<i>.<extension> to temp<i>_modified.<extension>
for f in $(ls)
do
    NAME=$(echo $f|awk -F"." '{print $1}')
    EXT=$(echo $f|awk -F"." '{print $2}')
    mv ${f} "${NAME}_modified.${EXT}"
done

### Command to ZIP all the .txt files to zip file named txt_compressed.zip
zip -r -q txt_compressed . -i \*.txt

exit 0