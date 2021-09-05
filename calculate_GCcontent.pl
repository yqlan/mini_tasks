#!/bin/perl
# use strict;
#=============================================================================================
# This perl program is used to output the reverse complementary sequnce of the given sequence.
# Usage: perl ReverseSeq.pl <inputfafile.fa>
# Author: Yongqing Lan
# E-mail: lanyq@big.ac.cn
# Date: 2015.12.26
#
#=============================================================================================

my ($in,$out)=@ARGV;
open IN, "<$in" || die "can't open the $in file!";
open OUT, ">>$out.GCcontent" || die "can't open the $out.GCcontent file!";

while (<IN>){
        chomp;
        print OUT "$_\n";
        my $seq = <IN>;
        chomp $seq;
        my @seqarr = split (//,$seq);
	my @gcarr;
        for ($i=0; $i<=$#seqarr; $i++) {
		if ($seqarr[$i] eq "G" or $seqarr[$i] eq "C" or $seqarr[$i] eq "g" or $seqarr[$i] eq "c"){
			$gcarr[$i] = 1;
			}
		elsif ($seqarr[$i] eq "A" or $seqarr[$i] eq "T" or $seqarr[$i] eq "a" or $seqarr[$i] eq "t") {
			$gcarr[$i] = 0;
			}
		}
	my $winnum = $#gcarr - 27;
	for ($j=0; $j<=$winnum; $j++){
		my $gcsum = 0;
		map { $gcsum += $_} @gcarr[$j..$j+27];
		my $gcmean = $gcsum / 28;
		if ($gcmean >= 0.5){
			print OUT "$j $gcmean\n";
			}
		}
        }
close IN;
close OUT;
