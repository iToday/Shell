#!/bin/bash

var="this is a new world!"
echo $var	#this is a new world!

echo "Test: $var"	#Test: this is a new world!
echo "Test2: ${var}" #Test2: this is a new world!


#let var2="this is test variable" //  syntax error in expression (error token is "is test variable")
let var2=1000
echo $var2	#1000

var3="this is the third variable!"

echo $var $var2 $var3	#this is a new world! 1000 this is the third variable!
echo "$var $var2 $var3"	#this is a new world! 1000 this is the third variable!
echo '$var $var2 $var3'	#$var $var2 $var3

echo $var : $var2 : $var3	#this is a new world! : 1000 : this is the third variable!
echo "$var : $var2 : $var3"	#this is a new world! : 1000 : this is the third variable!
echo '$var : $var2 : $var3'	#$var : $var2 : $var3


#变量合成变量
for var4 in 1 2 3
do
	echo $var4
	var5=var${var4}
	echo $var5
#	echo ${$var5}	#  ${$var5}: bad substitution

done

echo -e "\n"
echo -e "\e[1;31m input params \e[0m" 
#入参
echo $0
echo $1
echo $2

#系统变量
echo -e "\n"
echo -e "\e[1;31m sys var \e[0m" 
echo BASH$BASH
echo HOME$HOME
echo HOSTNAME:$HOSTNAME
echo LANG:$LANG
echo SECONDES:$SECONDS
echo SHELL:$SHELL
echo PATH:$PATH

#命令结果赋值
echo -e "\n"
echo -e "\e[1;31m ls1 \e[0m" 
ls="ls -l"
echo $ls
echo "$ls"
echo "$(ls)"

echo -e "\n"
echo -e "\e[1;31m ls2 \e[0m" 
ls="(ls -l)"
echo $ls
echo "$ls"
echo "$(ls)"

echo -e "\n"
echo -e "\e[1;31m ls3 \e[0m" 
ls="$(ls -l)"
echo $ls
echo "$ls"
echo "$(ls)"