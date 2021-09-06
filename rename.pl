#!/usr/bin/perl
use strict;
use warnings;

die "Usage:perl $0 <oldpattern> <newpattern> \n"if(@ARGV!=2);
my ($oldpattern,$newpattern)=@ARGV;
foreach my $file (glob "*"){
				my $newfile = $file;
				$newfile =~ s/$oldpattern/$newpattern/;
				if(-e $newfile){
						warn "Can't rename $file to $newfile. The $newfile exists!\n";
						}
				elsif(rename $file => $newfile){}
				else{
					warn "Rename $file to $newfile failed: $!\n";}
			}
	                                  	       	              
