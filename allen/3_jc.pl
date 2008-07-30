#!/usr/bin/perl -w


#load class_list
my %class;
open(CLASS,"class_list");
while(defined($class=<CLASS>)){
	chomp($class);
	$class{$class}="";
}

open(COMMENTED,">3.commented");
open(OUTPUT,">3.output");
open(EXPTBL,">3.exptbl");
open(JACLASS,">3.jaclass");
open(LANG,">3.lang");
open(MISC,">3.misc");
open(GT,">3.gtclass.chk");
open(DQ,">3.doublequote.chk");

open(FILE,"biglist");
while(defined($file=<FILE>)){
	chomp($file);
	open(INPUT,"$file");
	my $line_num=1;
	while(defined($line=<INPUT>)){
		chomp($line);
		foreach my $class (keys %class){
			if($line=~/\b$class\b/){

				if($line=~/^\s*'/){
					$line_num++;
					print COMMENTED $file."(".$line_num."):".$class.":".$line."\n";
					next;
				}
				if($line=~/^\s*\<\%\@ Page/){
					$line_num++;
					print MISC $file."(".$line_num."):".$class.":".$line."\n";
					next;
				}
				if($line=~/^\s*\<\%\@ Register/){
					$line_num++;
					print MISC $file."(".$line_num."):".$class.":".$line."\n";
					next;
				}
				if($line=~/<!--\s?\#include file=".*common.aspx"\s?-->/){
					$line_num++;
					print MISC $file."(".$line_num."):".$class.":".$line."\n";
					next;
				}
				if($line=~/>$class/i){
					$line_num++;
					print GT $file."(".$line_num."):".$class.":".$line."\n";
					next;
				}
				if($line=~/\"$class\"/i){
					$line_num++;
					print DQ $file."(".$line_num."):".$class.":".$line."\n";
					next;
				}
					
				my $lane=$line;
				$lane=~s/['"=,&\]\[><}{\)\(]/ /g;
				#$lane=~s/\( / /g;
				#$lane=~s/ \)/ /g;
				#$lane=~s/\(\)//g;
				my @thisline=split(/\s+/,$lane);
				foreach my $item (@thisline){

					foreach my $class (keys %class){
						if($item=~/\b$class\b/i){
							if($item=~/exptbl/i){
								print EXPTBL $file."(".$line_num."):".$class.":".$line."\n";
							}elsif($item=~/language/i){
								print LANG $file."(".$line_num."):".$class.":".$line."\n";
							}elsif($item=~/\w\.$class/i){
								print MISC $file."(".$line_num."):".$class.":".$line."\n";
							}elsif($item=~/-$class/i){
								print MISC $file."(".$line_num."):".$class.":".$line."\n";
							}elsif($item=~/_$class/i){
								print MISC $file."(".$line_num."):".$class.":".$line."\n";
							}elsif($item=~/>$class/i){
								print MISC $file."(".$line_num."):".$class.":".$line."\n";
							}elsif($item=~/ja:$class/i){
								print MISC $file."(".$line_num."):".$class.":".$line."\n";
							}elsif($item!~/ja\.$class/){
								print OUTPUT $file."(".$line_num."):".$class.":".$line."\n";
							}else{
								print JACLASS $file."(".$line_num."):".$class.":".$line."\n";
							}
						}
					}
				}
				#print "\n";
				#print "---------------------------\n";
				#print "$line\n";
				#print "============================\n";
			}
		}
		$line_num++;
	}
}
