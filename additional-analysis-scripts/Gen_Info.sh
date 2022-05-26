#!/bin/bash
#Created to create a file without put information according to Metadata order of individuals
x=2
while [ $x -le 97 ] #This can be adjusted based on number of files
do

	string="sed -n ${x}p Metadata_DNAA331_SD2.txt" #The file here represents whatever metadate file contains columns of barcodes and names
	str=$($string)

	var=$(echo $str | awk -F"\t" '{print $1,$2,$3}')   
	set -- $var
	c1=$1 #Well number A1, A2, etc.
	c2=$2 #Barcode
	c3=$3 #Shortened name of individual
	c4=$4 #Location

	du -hs ${3}_RA.sort.flt.bam >> duhs_test331
	samtools flagstat ${3}_RA.sort.flt.bam >sf_test331 
	#mv Plate330_RA_GG${c2}TGCAGG.fastq ${c3}_RA.fastq
	#mv Plate330_RB_GG${c2}TGCAGG.fastq ${c3}_RB.fastq

	x=$(( $x + 1 )) #This will loop the file to the next line

done


