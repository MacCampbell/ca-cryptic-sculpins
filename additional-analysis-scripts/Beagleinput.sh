#!/bin/bash -l

bamlist=$1
out=$2
#sites=$3

nInd=$(wc $bamlist | awk '{print $1}')

minInd=$[$nInd/2]

# ANGSD 0.916 cannot have sites called without inputing an actual sites file
angsd -bam $bamlist -out $out -nThreads 10 -minQ 20 -minMapQ 10 -minInd $minInd -GL 1 -doMajorMinor 1 -doMaf 1 -SNP_pval 1e-6 -minMaf 0.05 -doGlf 2

#ANGSD 0.910 uses the following without needing remove the sites argument. 
#angsd -bam $bamlist -out $out -sites $sites -nThreads 10 -minQ 20 -minMapQ 10 -minInd $minInd -GL 1 -doMajorMinor 1 -doMaf 1 -SNP_pval 1e-6 -minMaf 0.05 -doGlf 2 






