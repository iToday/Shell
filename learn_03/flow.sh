#!/bin/bash
##################################################################
echo for week in Monday Tuesday Wednesday Thursday Friday Saturday Sunday

for week in Monday Tuesday Wednesday Thursday Friday Saturday Sunday
do
	echo \$week=$week
#	sleep 1
done
##################################################################
value="Monday Tuesday Wednesday Thursday Friday Saturday Sunday"
echo
echo for week in \$value
for week in $value
do
	echo \$week=$week
#	sleep 1
done
##################################################################
values="1 3 5 7 9"
echo
echo for number in \'echo \$values\'

for number in 'echo $values'
do
	echo \$number=$number
	echo \"\$number\"="$number"
	
	sleep 1
done
##################################################################
echo
echo for number in \$\(echo \$values\)

for number in $(echo $values)
do
	echo \$number=$number
	echo \"\$number\"="$number"
	
#	sleep 1
done
##################################################################
echo 
echo "for number in \"\$(echo \$values)\""

for number in "$(echo $values)"
do
	echo \$number=$number
	echo \"\$number\"="$number"
	
#	sleep 1
done
##################################################################
echo
declare -i x=0
declare -i y=3

echo while\(\(x \< y\)\)

while((x < y))
do
	echo x=$x
	let x++
done
##################################################################
var=5
while echo "number=$value"
	value=$var
	[ $var -ne 8 ]
do
	echo input var:
	read var
	echo "value -eq $var"
done
##################################################################
echo
x=1
count=0
until [ $count -gt 10 ]
do
	let count+=1
	let ++x
done
echo $count
##################################################################

echo
echo please input name:
read name
case "$name" in 
	(mary | roland | jack)
	echo welcome back
	echo long time no to see
	echo how do you do?
;;
	(may|joe)
	echo welcome ...
	echo what do you want to do?
;;
esac
##################################################################
echo
#PS3作为select语句的shell界面提示符，提示符为PS3的值（赋予的字符串），更换默认的提示符”#?”
PS3="input number:"

select f in *
do
	echo "the number is $REPLY,the file is $f"
	# 当且仅当在没有变量提供给"read"命令时, REPLY才保存最后一个"read"命令读入的值.	
	break
done
##################################################################
PS3="choose the number:"
echo

choice_of()
{
	select value
	do
		echo "the value is $value"
		break
	done
}	

choice_of 23 44 45 60
##################################################################
