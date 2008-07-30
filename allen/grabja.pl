#!/usr/bin/perl -w
my %jaclass;
open(INPUT,"jaclass_list");
while(defined($line=<INPUT>)){
	$line=~/ja.(\w+)/;
	$jaclass{$1}="";
}

foreach $item (sort keys %jaclass){
	print "$item\n";
}
