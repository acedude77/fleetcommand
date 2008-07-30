#!/usr/bin/perl -w


#load class_list
my %class;
open(CLASS,"class_list");
while(defined($class=<CLASS>)){
	chomp($class);
	$class{$class}="";
}

open(OUTPUT,">2.output");

open(FILE,"biglist");
while(defined($file=<FILE>)){
	chomp($file);
	open(INPUT,"$file");
	my $line_num=1;
	while(defined($line=<INPUT>)){
		chomp($line);
		foreach my $class (keys %class){
			if($line=~/\b$class\b/i){
				print OUTPUT $file."(".$line_num."):".$class.":".$line."\n";
			}
		}
		$line_num++;
	}
}
