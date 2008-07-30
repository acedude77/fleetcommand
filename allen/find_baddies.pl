#!/usr/bin/perl -w


#load class_list
my %class;
open(CLASS,"class_list");
while(defined($class=<CLASS>)){
	chomp($class);
	$class{$class}="";
}

open(JACLASS,">jaclass_list");


#load skip_list
#my %skip;
#open(SKIP,"skip_list");
#while(defined($skip=<SKIP>)){
#	chomp($skip);
#	$skip{$skip}="";
#}

open(SKIP,">skip_list");

open(FILE,"biglist");
while(defined($file=<FILE>)){
	chomp($file);
	open(INPUT,"$file");
	my $line_num=1;
	while(defined($line=<INPUT>)){
		next if($line=~/\s*'/);
		
		foreach my $class (keys %class){
			if($line=~/$class/){

				$okline="ja.".$class;
#skip properly formed classes (ja.className)
				if($line=~/\s+$okline/){ 
					$line_num++;
					print JACLASS $line;
					next;
				}elsif($line=~/(\w+$class\w*)/){
					print SKIP "$class: $1\n";
					$line_num++;
					next;
				}elsif($line=~/(\w*$class\w+)/){
					print SKIP "$class: $1\n";
					$line_num++;
					next;
#				}elsif($line=~/\($okline/){
#					$line_num++;
#					next;
#				}elsif($line=~/\w$class/){
#					$line_num++;
#					next;
#				}elsif($line=~/$class\w/){
#					$line_num++;
#					next;
				}else{
					print "Class Name  : $class\n";
					print "File        : $file\n";
					print "Line Number : $line_num\n";
					print "Line Text   : $line";
					print "--------------------------\n";
				}
			}	
		}
		$line_num++;
	}
}

