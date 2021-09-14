#!/bin/bash

### Finding all the words from source($1) ending with *ing/*ING
### Converting the strings to lower case
### Flushing out the data to destination($2)
grep -oi "[a-z\-]*ing" $1 | tr [:upper:] [:lower:] > $2
