# Assignment-1: Bash Scripting

## Software Systems Development 

---
---
>Disclaimer
* If the below script files, doesn't execute and raher ask for permission. Run the below command, to grant execute permission: 

    ```
    chmod +x q1.sh q2.sh q3.sh q4.sh q5.sh
    ```
---
---

### [q1.sh]()

> Overview

* This script prints the name all the directories, along with their size, on the terminal that are present in the current directory, i.e., the path where this script would be executed. In case, if no directories exist, nothing will be printed on terminal.

---

### [q2.sh]()

> Overview

* This script will read one file and fetch all the english words that are ending with _ing_, and write those words into a separte file with new line as delimeter.


>Arguments
* This script will take **2 arguments** :
    
    1. First argument -  reltive path of the file to be read **(Input file)**.
    2. Second argument - relative path of the file to be written **(Output file)**.

> Assumption
1. The Input file must have alphabets and no special character appended with _ing_ and must have delimeter as space.

2. The output file will have all the records in **lowercase**, despite Input file having words in uppercase. The script will transform such uppercase word and write it in Output file in lowercase.

---

### [q3.sh]()

> Overview
* This script will check whether a given input string which when permuted, matches with any of the _bash commands_. If it does, those commands would be printed on terminal in a sorted way with delimeter as tab.
If nothing matches, **NO** string will be printed on terminal.

> Arguments
* This script will take **1 argument**:
    1. First argument - The string that will be permuted and compared against different _Bash commands_.

---

### [q4.sh]()

> Overview
* This script does 3 things.
    * Case 1 -
        * Takes one **Integer** argument as an input and converts to Roman Numeral.
    * Case 2 -
        * Takes 2 argumens either both **Integers** or **Roman Numeral** and does the following:
            * If arguments are of type _Integers_ then this script performs **Addition** on given two Integers and **converts** to Roman Numeral.
            * If arguments are of type _Roman Numeral_ then this script performs  **Addition** on two Roman Numerals and **converts** into Integer.

* Answer will be printed on terminal itself.

> Arguments
* This script will take either **1 argument** or **2 arguments**:
    * Case 1 - 
        * First argument - Integer that would be converted into Roamn Numeral.
    * Case 2 -
        * First argument - Integer number.
        * Second argument - Integer number.
    * Case 3 - 
        * First argument - Roman Numeral.
        * Second argument - Roman Numeral.

> Assumptions
* The Roman Numerals must be in uppercase.
* The Intergers arguments must be such that their sum should be within the valid range of Roman Numeral.

---

### [q5.sh]()

> Overview
* This script would do the following set of actions:
    * Create a directory named - **temp_activity** if doesn't exists in the current path.
    * Inside the directory named **temp_activity**:
        * Creates 50 files named temp_<#number>_.txt.
        * Changes the extention of firts 25 _TEXT_ files to _MARKDOWN_ files.
        * Append "\_modified" word to the name of each _TEXT_ files.
        * Compress all the _TEXT_ files and stores in the zip named **txt_compressed.zip**, without deleting the original files.
