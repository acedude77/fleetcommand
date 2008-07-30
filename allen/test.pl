#!/usr/bin/perl -w


open(INPUT,"trunk/view_feedback.aspx");


while(defined($line=<INPUT>)){

	if($line=~/<!--\#include file="common.aspx"-->/){
		print "ok\n";
	}
}
