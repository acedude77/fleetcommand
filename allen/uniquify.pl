#!/usr/bin/perl -w
open(INPUT,"@ARGV");
my %uniquify;
while(defined($line=<INPUT>)){
	chomp($line);
	$line=~s/^\s+//;
	if(exists($uniquify{$line})){
		print STDERR "### duplicate found: $line\n";
	}
	$uniquify{$line}="";
}
foreach $item (sort keys %uniquify){
	print "$item\n";
}
