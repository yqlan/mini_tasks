#!usr/bin/perl
use warnings;

unless (@ARGV==1){
        die "Usage: perl $0 <input DNA seq>(5\' -> 3\')!";
}
my ($DNAseqinput)=@ARGV;
my @DNAseqArray = split "",$DNAseqinput;
my @cDNAseqArray;
foreach $base (@DNAseqArray) {
	if ($base eq "a" or $base eq "A"){
		push @cDNAseqArray, "T";
		}
	elsif ($base eq "t" or $base eq "T"){
		push @cDNAseqArray, "A";
		}
	elsif ($base eq "c" or $base eq "C"){
		push @cDNAseqArray, "G";
		}	
	elsif ($base eq "g" or $base eq "G"){
		push @cDNAseqArray, "C";
		}
	}
my @cDNAseqArrayR= reverse(@cDNAseqArray);
print "DNAseqinput(5\' -> 3\')  : ";print @DNAseqArray,"\n";
print "cDNAseqoutput(3\' -> 5\'): ";print @cDNAseqArray,"\n";
print "cDNAseqoutput(5\' -> 3\'): ";print @cDNAseqArrayR,"\n";
