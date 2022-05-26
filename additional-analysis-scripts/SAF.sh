#!/bin/bash -l

bamlist=$1
out=$2
Anc=$3

angsd -bam ${bamlist} -out ${out} -anc ${Anc} -GL 1 -doSaf 1 -minQ 20 -minMapQ 10 -minInd 1 
