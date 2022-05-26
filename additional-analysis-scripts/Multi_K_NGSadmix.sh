#!/bin/bash -l

Name=$1 # Name chosen as output out of beagleinput.sh
K=$2 #Number of clusters you wish to run (Ks)
It=$3 #Number of iterations per cluster you wish to run

y=1
while [ $y -le ${K} ]
do
	x=1
	while [ $x -le ${It} ] 
	do

		sbatch -p med -t 24:00:00 NGS_Admixture.sh ${Name}.beagle.gz ${Name}${y}${x} ${y} 

		x=$(( $x + 1 ))

	done

y=$(( $y + 1 ))

done
