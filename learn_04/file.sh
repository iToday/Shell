#!/bin/bash
##################################################################
readme=./README.MD
#readme='./README.MD'
#readme="./README.MD"

if [ -f $readme ] # -e == -f
then
	echo ./README.MD the file is exist!
else
	echo No suck file.
fi
##################################################################
echo

[ -f $readme ] || ( echo No such file.; exit 1)

if [ $? -eq 1 ]	# $?	上个命令的退出状态，或函数的返回值。
then
	exit
fi

echo ./README.MD the file exists.
##################################################################

echo -n "input a name of file:"

read f_name

if [ -f $f_name ]
then
	echo the file exists.
	echo
#	exit
else
	until [ -e $f_name ]
	do
		echo
		echo -n input a name of file:
		read f_name
	done
fi
echo $f_name exists.
##################################################################

if [ -f ./learn_04/test ]
then
	echo the file exists.
	echo
else
	echo no such file.
	echo create a new file...
	sleep 1
	touch ./learn_04/test; echo file of tet create successed.
fi