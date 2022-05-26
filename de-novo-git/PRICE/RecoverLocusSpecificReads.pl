#!/usr/bin/perl

$fasta = $ARGV[0];
$R1file = $ARGV[1];
$R2file = $ARGV[2];

$left = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAATGCAGG";

open(FILE, "<$fasta") or die;

while (<FILE>) {

	$l1 = $_;
	$l2 = <FILE>;
	chomp($l1); chomp($l2); substr($l1, 0, 1) = "";
	
	$hash{$l2} = $l1;

	$o1 = $l1 . "_R1.fastq";
	$o2 = $l1 . "_R2.fastq";

	open($o1, ">$o1") or die;
	open($o2, ">$o2") or die;

	$o3 = $l1 . ".fasta";
	open($o3, ">$o3") or die;
	$seq = $left . $l2;
	print $o3 ">$l1\n$seq\n";
	close $o3;

}
close FILE;


$seql = length($l2);

open(FILE1, "<$R1file")
	or die;
open(FILE2, "<$R2file")
	or die;

while (<FILE1>) {

	$ID_line_1 = $_;
	$seq_line = <FILE1>;
	$ID_line_2 = <FILE1>;
	$Quality_line = <FILE1>;
	

        $ID_line_12 = <FILE2>;;
        $seq_line2 = <FILE2>;
        $ID_line_22 = <FILE2>;
        $Quality_line2 = <FILE2>;

	$subseq = substr($seq_line,0,$seql);
	
	if ($hash{$subseq} ne "")  {

		$o1 = $hash{$subseq} . "_R1.fastq";
        	$o2 = $hash{$subseq} . "_R2.fastq";
	
		print $o1 $ID_line_1;
		print $o1 $seq_line;
		print $o1 $ID_line_2;
		print $o1 $Quality_line;

		$s1 = substr($seq_line2, 0, length($seq_line)-1); $s1 = "$s1\n";
		$s2 = substr($Quality_line2, 0, length($seq_line)-1); $s2 = "$s2\n";

		print $o2 $ID_line_12;
                print $o2 $s1;
                print $o2 $ID_line_22;
                print $o2 $s2;


	} 

}
close FILE1; close FILE2;


