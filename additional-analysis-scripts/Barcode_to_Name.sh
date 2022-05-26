#!/bin/bash
#This script is used to remove the barcode from file names and replace it with the individual name
x=3
while [ $x -le 98 ] #This can be adjusted based on number of files
do

	string="sed -n ${x}p 104.txt" #The file here represents whatever metadate file contains columns of barcodes and names
	str=$($string)

	var=$(echo $str | awk -F"\t" '{print $1,$2,$3}')   
	set -- $var
	c1=$1 #Well Number
	c2=$2 #Barcode
	c3=$3 #Sample Name

	mv SOMM084__RA_GG${c2}TGCAGG.fastq ${c3}_RA.fastq
	mv SOMM084__RB_GG${c2}TGCAGG.fastq ${c3}_RB.fastq

	x=$(( $x + 1 )) #This will loop the file to the next line

done



