#!/bin/bash
#SBATCH --mem 16G

#novoindex Pit.fa.idx Pit.fasta
#6924184.out

#novoalign -r E 48 -t 180 -d Pit.fa.idx -f Pit.fasta > Pit.novo
#6924185.out

./IdentifyLoci3.pl Pit.novo > Pit_IDloci.fasta
#6924863.out
