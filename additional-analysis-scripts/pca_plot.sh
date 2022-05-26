#!/bin/bash -l

out=$1
Rscript --vanilla --slave plotPCA_2.R -i ${out}.covar -c 1-2 -a ${out}.clst -o ${out}_12_pca.pdf
Rscript --vanilla --slave plotPCA_2.R -i ${out}.covar -c 1-3 -a ${out}.clst -o ${out}_13_pca.pdf
Rscript --vanilla --slave plotPCA_2.R -i ${out}.covar -c 2-3 -a ${out}.clst -o ${out}_23_pca.pdf

