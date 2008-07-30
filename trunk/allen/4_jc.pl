#!/usr/bin/perl -w

use DBI;

my $dsn = "DBI:mysql:database=test;host=localhost;";
my $dbh = DBI->connect($dsn, "root","");



#load class_list
my %class;
open(CLASS,"class_list");
while(defined($class=<CLASS>)){
	chomp($class);
	$class{$class}="";
}

#open(COMMENTED,">3.commented");
#open(OUTPUT,">3.output");
#open(EXPTBL,">3.exptbl");
#open(JACLASS,">3.jaclass");
#open(LANG,">3.lang");
#open(MISC,">3.misc");
#open(GT,">3.gtclass.chk");
#open(DQ,">3.doublequote.chk");

my %database;

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
					$database{$file}{$line_num}{$class}{comment}="$line";
					goto NEXTLINE;
				}
				if($line=~/^\s*\<\%\@ Page/){
					$database{$file}{$line_num}{$class}{page}="$line";
					goto NEXTLINE;
				}
				if($line=~/^\s*\<\%\@ Register/){
					$database{$file}{$line_num}{$class}{register}="$line";
					goto NEXTLINE;
				}
				if($line=~/<!--\s?\#include file=".*common.aspx"\s?-->/){
					$database{$file}{$line_num}{$class}{"common.aspx"}="$line";
					goto NEXTLINE;
				}
				if($line=~/>$class/i){
					$database{$file}{$line_num}{$class}{"gtclass"}="$line";
					goto NEXTLINE;
				}
				if($line=~/\"$class\"/i){
					$database{$file}{$line_num}{$class}{dq}="$line";
					goto NEXTLINE;
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
								$database{$file}{$line_num}{$class}{"exptbl"}="$line";
							}elsif($item=~/language/i){
								$database{$file}{$line_num}{$class}{"language"}="$line";
							}elsif($item=~/\bja\.$class\b/i){
								$database{$file}{$line_num}{$class}{"ja.class"}="$line";
							}elsif($item=~/\w\.$class/i){
								$database{$file}{$line_num}{$class}{"az.class"}="$line";
							}elsif($item=~/-$class/i){
								$database{$file}{$line_num}{$class}{"dashclass"}="$line";
							}elsif($item=~/_$class/i){
								$database{$file}{$line_num}{$class}{"underscoreclass"}="$line";
							}elsif($item=~/ja:$class/i){
								$database{$file}{$line_num}{$class}{"colonclass"}="$line";
							}elsif($item!~/ja\.$class/){
								$database{$file}{$line_num}{$class}{"output"}="$line";
							}else{
								$database{$file}{$line_num}{$class}{"jaclass"}="$line";
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
		NEXTLINE:
		$line_num++;
	}
}


my $sth=$dbh->prepare("insert into codeparser (filename,line_number,line,class,sort_type) values (?,?,?,?,?)");
 
foreach my $a (keys %database){
	foreach $b (keys %{$database{$a}}){
		foreach $c (keys %{$database{$a}{$b}}){
			foreach $d (keys %{$database{$a}{$b}{$c}}){
				my $line=$database{$a}{$b}{$c}{$d};
				$sth->execute($a,$b,$line,$c,$d);
			}
		}
	}
}
