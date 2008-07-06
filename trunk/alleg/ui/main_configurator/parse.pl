#!/usr/bin/perl -w

open(INPUT,"input");
while(<INPUT>){
	chomp($_);
	my @input=split(/\t/,$_);
	foreach my $item (@input){
		print "$item ";
	}
	print "\n";
}
