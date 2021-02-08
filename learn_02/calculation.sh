#!/bin/bash

declare -i x
declare -i y=100

echo x=$x
echo y=$y

echo x+y=$((x+y))
echo x+y=$(( x + y ))

echo $((${x:-12}+y))
echo $((${y:-12}+y))

for((i=1;i<=100;i++))
do
	if [ $i -eq 9 ]
	then
		break
	fi
	
	echo $i
	
done

for((x=1;x<=100;x++))
do
	for((y=1;y<=100;y++))
	do
		var=$((x+y))
		
		if [ $var -eq 5 ]
		then
			break 2
		fi
		
		echo x+y=$x+$y=$var
	done
done

x=5

if [ $x -lt $y ]
then
	echo x=$x is smaller
else
	echo y=$y is smaller
fi

if [ $x -gt $y ]
then
	echo x=$x is bigger
else
	echo y=$y is bigger
fi

if [ ! $x -eq $y ]
then
	echo x!=y
else
	echo x==y
fi

x=16
y=15

echo "x >>1 = "$((x >> 1))
echo "y >> 1 = "$((y >> 1))

echo "x <<1 = "$((x << 1))
echo "y << 1 = "$((y << 1))


echo "x & 1 = "$((x & 1))
echo "y & 1 = "$((y & 1))

echo "x | 1 = "$((x | 1))
echo "y | 1 = "$((y | 1))

if [ -z $1 ]
then
	echo "\$1 is null"
else
	echo "\$1 is "$1
fi
