#!/bin/perl
#use strict;
##=============================================================================================
# This perl program is used to output the reverse complementary sequnce of the given sequence.
# Usage: perl ReverseSeq.pl <inputfafile.fa> <outputfilename>
# Author: Yongqing Lan
# E-mail: lanyq@big.ac.cn
# Date: 2015.12.26
#
##=============================================================================================

my ($in,$out)=@ARGV;
open IN, "<$in" || die "can't open the $in file!";
open OUT, ">$out.rc.fa" || die "can't open the $out.rc.fa file!";
while (<IN>){
	chomp;
	print OUT "$_\n";
	my $seq = <IN>;
	chomp $seq;
	my $revseq = reverse($seq);
	my @newseq = split (//,$revseq);
	for ($i=0; $i<=$#newseq; $i++) {
		if ($newseq[$i] eq "A" or $newseq[$i] eq "a"){
			$newseq[$i] = "T";
			}
		elsif ($newseq[$i] eq "T" or $newseq[$i] eq "t"){
                        $newseq[$i] = "A";
                        }
		elsif ($newseq[$i] eq "C" or $newseq[$i] eq "c"){
                        $newseq[$i] = "G";
                        }
		elsif ($newseq[$i] eq "G" or $newseq[$i] eq "g"){
                        $newseq[$i] = "C";
                        }
		}
	my $finalseq = join ("",@newseq);
	print OUT "$finalseq\n";
	}
close IN;
close OUT;
