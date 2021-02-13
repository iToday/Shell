#!/bin/bash
# this is second line
# this is thirdly line
##################################################################
str1=root

if [ $str1 = "root" ]
then
	echo str1=root
else
	echo str1!=root
fi

str2=test

if [ $str1 != $str2 ]
then
	echo str1 != str2
else
	echo str1=str2
fi

if [ -z $str1 ]
then
	echo nothing in the string.
else
	echo str1 is not null\(-z\)
fi

if [ -n $str1 ]
then
	echo str1 is not null\(-n\).
else
	echo nothing in the sring.
fi

##################################################################
echo
str3="hello,this is xba1987@126.com. hi"

temp=${str3%.*}
echo $temp
echo

temp=${str3%%.*}
echo $temp
echo

temp=${str3#*is*}
echo $temp
echo

temp=${str3#*.*} #左边第一个.
echo $temp
echo

temp=${str3%*.*} #右边第一个.
echo $temp
echo

temp=${str3%*com*}
echo $temp
echo
##################################################################
str4="root:x:0:0:root:/root:/bin/bash"

temp=${str4/:/,} #替换第一个
echo $temp

temp=${str4//:/,} #全部替换
echo $temp

echo str4 size:${#temp}
echo str4 size:$(expr length "$str4")
echo str4 size:$(expr "$str4":'.*')
##################################################################
echo
str5="hello shell script."
echo $str5

cat <<HERE
this is the first shell script.
add it is bash shell.
HERE

echo str5=$str5

##################################################################
file=./learn_07/string.sh
{
	read line1
	read line2
	read line3
}<$file

echo the file of second line in $file is: $line2
echo

echo the file of thirdly line in $file is: $line3
echo