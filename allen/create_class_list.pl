#!/usr/bin/perl -w


open(INPUT,"listofall_cs_vb_aspx_asmx");

while(defined($file=<INPUT>)){
	chomp($file);
	open(FILE,"$file");
	my $line_num=1;
	while(defined($line=<FILE>)){
		chomp($line);
		if($line=~/public.* class /i){
			if($line=~/\s*'/){
				next;
				print "found commented line: $line";
			}
			#for clean class_list enable below
			$line=~s/\s*public mustinherit class\s*//i;
			$line=~s/\s*public notinheritable class\s*//i;
			$line=~s/\s*partial public notinheritable class\s*//i;
			$line=~s/\s*partial public class\s*//i;
			$line=~s/\s*public partial class\s*//i;
			$line=~s/\s*public class\s*//i;
			$line=~s/ :.*//;
			$line=~s/\s*{.*//;
			$line=~s/\s*<.*//;
			$line=~s/\s*\(.*//;
			$line=~s/\s*//g;
			print "$line\n";

			#for raw output enable below
			#print "$file ($line_num): $line";
		}
		$line_num++;
	}	
}
