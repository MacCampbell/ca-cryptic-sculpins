#!/bin/bash -l

pop1=$1
pop2=$2

/home/djprince/programs/angsd/misc/realSFS -tole 1e-12 ${pop1}.saf.idx ${pop2}.saf.idx > ${pop1}_${pop2}.ml
/home/djprince/programs/angsd/misc/realSFS fst index ${pop1}.saf.idx ${pop2}.saf.idx -sfs ${pop1}_${pop2}.ml -fstout ${pop1}_${pop2}.fstout
/home/djprince/programs/angsd/misc/realSFS fst stats ${pop1}_${pop2}.fstout.fst.idx > ${pop1}_${pop2}.finalfstout 
