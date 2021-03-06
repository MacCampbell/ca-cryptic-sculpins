#!/bin/bash -l


list=$1
num=$2

wc=$(wc -l ${list} | awk '{print $1}')

x=1
while [ $x -le $wc ] 
do
	string="sed -n ${x}p ${list}" 
	str=$($string)

	var=$(echo $str | awk -F"\t" '{print $1, $2}')   
	set -- $var
	c1=$1
	c2=$2

	count=$(samtools view -c ${c1}.bam)

        if [ $num -le $count ]
        then
                frac=$(bc -l <<< $num/$count)
                samtools view -bs $frac ${c1}.bam > ${c1}_${num}.bam
                samtools index ${c1}_${num}.bam ${c1}_${num}.bam.bai
        fi

	x=$(( $x + 1 ))

done


