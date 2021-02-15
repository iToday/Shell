#!/bin/bash
##################################################################
ps | awk '{print "this is fist field message:"$1}'

echo
ls -lF ./ |awk '{print $9 "\t" $5}'

echo

echo $(dirname "$0")
echo $0

ls -lF ./ |awk '{print $9 "\t" $5}' > $(dirname "$0")/test
