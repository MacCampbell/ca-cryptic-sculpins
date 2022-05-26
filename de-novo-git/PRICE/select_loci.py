#!/usr/bin/env python

import sys
import collections

F1 = sys.argv[1]
n = sys.argv[2]
out = F1.split('.')[0]

with open(F1) as File1, open(out + '_' + n + '.fasta', 'w') as File2:
	Lines = File1.readlines()
	Loci = Lines[0::2]
	Seq = Lines[1::2]
	Loci_Seq = zip(Loci,Seq)
	D = {}
	for Loci, Seq in Loci_Seq:
		D[Loci.rstrip('\n')] = Seq.rstrip('\n')

	Fasta = collections.OrderedDict(sorted(D.items()))

	for key, value in Fasta.iteritems():
		if len(value) >= float(n):
			File2.write(key + '\n' + value + '\n')

