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
         (my $dev,my $ino,my $mode,my $nlink,my $uid,my $gid,my $rdev,my $size,my $atime,my $mtime,my $ctime,my $blksize,my $blocks) =stat($f);
         if ($blocks * 512 < $size) {
                 print "$f => SZ: $size BLSZ: $blksize BLKS: $blocks\n";
                 #print "\t" . -s $f;
         }
}
find(\&process_file,@ARGV);
