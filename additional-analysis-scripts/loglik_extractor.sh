#!/bin/bash -l

Name=$1 #Name appearing betfore each .log file minus the numbering
K=$2  # The number of clusters (Ks) you ran
It=$3 #The number of iterations per K you ran - e.g. 3, 5, or 10 

y=1
while [ $y -le ${K} ]
do
	x=1
	while [ $x -le ${It} ] 
	do

		grep -h "^best" --no-group-separator  ${Name}${y}${x}.log | cut -c11-24 >> ${Name}.log.txt

		x=$(( $x + 1 ))

	done

y=$(( $y + 1 ))

done
