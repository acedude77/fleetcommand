#!/usr/bin/perl -w
use strict;
use warnings;

if(!defined(@ARGV)){
	print "$0 <full path>\n";
	exit;
}

use File::Find;
sub process_file {
         my $f=$File::Find::name;
	if(-f){
		(my $dev,my $ino,my $mode,my $nlink,my $uid,my $gid,my $rdev,my $size,my $atime,my $mtime,my $ctime,my $blksize,my $blocks) =stat($f);
		my $space_used=$blocks*512;
         	if ($space_used < $size) {
                 	print "$f => size: $size   actual space used: $space_used\n";
         	}
	}
}
find(\&process_file,@ARGV);
