#!/bin/bash
FOLDER=../$1
BASE=$2
BROWSER=$3
VERSION=$4

echo '# THIS FILE IS GENERATED: DO NOT EDIT!' > $FOLDER/Dockerfile
echo FROM selenium/$BASE:$VERSION >> $FOLDER/Dockerfile
cat ../NodeDebug/Dockerfile.txt >> $FOLDER/Dockerfile

cp ./clear_x_locks.sh \
   ./entry_point.sh $FOLDER

BROWSER_LC=$(echo $BROWSER |  tr '[:upper:]' '[:lower:]')

cat ./README.template.md \
  | sed "s/##BROWSER##/$BROWSER/" \
  | sed "s/##BROWSER_LC##/$BROWSER_LC/" \
  | sed "s/##BASE##/$BASE/" \
  | sed "s/##FOLDER##/$1/" > $FOLDER/README.md


cat ./README-short.template.txt \
  | sed "s/##BROWSER##/$BROWSER/" > $FOLDER/README-short.txt
