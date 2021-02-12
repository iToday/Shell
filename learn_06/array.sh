#!/bin/bash
##################################################################
value[a]=36
province[b]=guangdong
city[c]=shenzhen

MES=(this is the first script.)

echo $value[a]
echo "${value[a]}"
echo $province[b]
echo "${province[b]}"
echo $city[c]
echo "${city[c]}"
echo "my hometown is ${province[b]} ${city[c]}."
echo "my hometown is ${province} ${city}."
echo

echo "explain:${MES[*]}"
echo "explain:${MES[@]}"

echo ${MES[0]} ${MES[1]} ${MES[2]} ${MES[3]}  ${MES[4]}
echo

##################################################################

array1=(A B C)
array2=(D E F)
array3=(G H I)

for ((i=0; i<4; i++))
do
	eval value=\${array${i}[*]}
	
	for element in ${value}
	do
		echo -e ${value}
		continue 2
	done
done

##################################################################
echo

array1="A B C"
array2="D E F"
array3="G H I"

for i in array1 array2 array3
do
	eval value=\$$i
	for j in $value
	do
		echo -e $j
	done
done
##################################################################
echo

array=(34 35 36 37 38 39)
declare -i limit=4
declare -i j=0

array2=(
	element2
	element3
	element4
)

array3=(element5 element6 element7)

array4=()
array5=('')

ARRAY()
{
	echo ">>two-dimensional array<<"
	echo
	echo "${array2[*]}"
	echo "${array3[*]}"
	
	
	while [ $j -lt $limit ]
	do
		echo "${array[*]:$j:3}"
		let j+=2
		let j++
	done
	
	echo "element of array3 is :${array3[@]}"
	echo "element of array4 is :${array4[@]}"
	echo "element of array5 is :${array5[@]}"
	
	let j=0
	while [ $j -lt $limit ]
	do
		echo "${array[*]:$j:3}"
		let j+=2
		let j++
	done > /dev/null #不输出
}

ARRAY
##################################################################

week=(Monday Tuesday Wednesday Thursday Friday)

echo ${week[0]}
echo ${week:0}
echo ${week:1}
echo ${week[1]:2}
echo
echo ${week[@]:0}
echo ${week[@]:1}
echo ${week[@]:2:2} #从数组中第二个元素后开始读取出两个元素
echo
echo ${week[@]/Monday/First_Day} #使用First_Day替换数组中Monday
echo ${week[@]/T/vacation}
echo ${week[@]/*iday/Day_Five}
echo
echo "<--delete character-->"

echo ${week[@]#M*y}
echo ${week[@]##F*y}
echo ${week[@]%Th*y}
echo ${week[@]%%W*y}
echo
echo "<--add character-->"
echo ${week[@]/%/36}

echo
echo "<--#-->"
echo ${#week}	 #数组中第1个元素的字符长度
echo ${#week[0]} #数组中第1个元素的字符长度
echo ${#week[1]} #数组中第2个元素的字符长度
echo ${#week[@]} #数组元素个数

echo "<---->"
echo ${week[@]}
echo ${week[*]}
echo 

echo "<--delete element-->"
unset week[1]
echo ${week[@]}

echo
echo "<--array copy-->"
array=("${week[@]}")
echo array=${array[@]}

##################################################################

ARRAY2=(
	"${week[*]}"
	"var_d=element5 var_e=element6 var_f=element7"
)

PRINT()
{
#	IFS=$'\n' #数组打印换行
	echo
	echo "ARRAY2:${ARRAY2[*]}"
}

PRINT

##################################################################
string=abcdef123456789

echo
echo "<--string-->"
echo ${string[0]}
echo ${string[1]} #没有输出
echo ${#string[@]} #数组元素个数1
