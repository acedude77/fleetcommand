#!/usr/bin/perl -w

open(INPUT,"starcon_constellations");
while(defined($line=<INPUT>)){


	@a=split(/<\/td>/,$line);
	foreach $item (@a){
		if($item=~/query=(.*)\"/){
			print $1."\n";
		}
	}
}
