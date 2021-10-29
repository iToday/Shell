#!/bin/bash

g_dir=$1
g_key=$2
g_pre_offset=$3
g_after_offset=$4

g_files=""

function getdir(){

   # echo $1
	
    for file in $1/*
    do
		if test -f $file
		then
			if [ "${file##*.}"x = "txt"x ] || [ "${file##*.}"x = "TXT"x ];then
				g_files=(${g_files[*]} $file)
			fi  	
				
		else
			getdir $file
		fi
    done
}


function key_parser_in_file(){

	file=$1
	key=$2
	
	#echo key_parser_in_file $1 $2
	
	line_numbers=$(grep -n $key $file | awk -F ":" '{print $1}')
	
	let last_valid_line=0
	
	for line in $line_numbers 
	do
		
		let start=line-g_pre_offset
		let end=line+g_after_offset
		
		
		if [ $last_valid_line -eq 0 ]; then 
			let last_valid_line=line
		else
			let sub=line-last_valid_line
			if [ $sub -lt 5000 ]; then
				echo "this is one error"
				continue
			fi
		fi
		
		let last_valid_line=line
		
		echo line:$line
		echo start:$start
		echo end:$end
		
		if [ $start -lt 0 ]; then 
			let start=0 
		fi
		
		sed -n "${start},${end}p" $file > $file.$line.core
	done
	
}

function key_parser(){

	files=$1
	key=$2
	pre=$3
	after=$4
	
	#echo key_parser ${g_files[@]}

	for file in ${g_files[@]}
	do
		key_parser_in_file $file $key $pre $after
		echo $file
	done
}

getdir $g_dir
key_parser $g_files $g_key $g_pre_offset $g_after_offset

echo log parser finish
