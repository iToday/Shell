#!/bin/bash
##################################################################
hello()
{
	
	echo "hello, today is '$(date -d now)'"
	echo welcome back!
}

hello
echo

##################################################################
funky()
{
	echo
	echo this is the first function.
	echo now exiting funky function.
}

funky2()
{
	x=0
	repeats=3
	echo
	echo now, the funky2 really begins.
	sleep 1
	
	while [ $x -lt $repeats ]
	do
		echo ------funky2----x=$x---
		
		sleep 1
		let x++
	done
	
	echo now, the funky2 ends.
}

funky
funky2
echo
##################################################################
IS_A_FILE()
{
	_FILE_NAME=$1
	echo the file exists...
	
	if [ !-f $_FILE_NAME ]
	then
		return 1
	else
		return 0
	fi
	
	
	
	touch_file()
	{
		touch
	}
}

error_msg()
{
	echo \$\@=$@ #获取不到脚本参数
	return 0
}


for files in *
do
	echo -n enter the file name:
	read direc
	
	if [ -f $direc ]
	then
		echo check files...
		sleep 1
		break 2
	else
		touch file2
		echo create file, please wait...
		sleep 1
		echo finish,new file name is file2.
	fi
done

IS_A_FILE

#echo  \$\?=$?


if [ $? != 0 ]
then
	error_msg
fi

echo \$\@=$@ #可以获取到脚本参数
##################################################################
PARAMETER()
{
	echo "$1"
}

message="parameter"
parameter="this is the first parameter!"

PARAMETER "$message"
PARAMETER "${!message}"

echo

parameter="Goodbye parameter!"

PARAMETER "$message"
PARAMETER "${!message}"
##################################################################
RETURN()
{
	return $1
}

echo

RETURN 36
echo "return 36=$?"

RETURN 255
echo "return 255=$?"

RETURN 256
echo "return 256=$?"

RETURN 3645
echo "return 2645=$?"

RETURN -100
echo "return -100=$?"

