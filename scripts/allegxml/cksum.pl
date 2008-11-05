#!/usr/bin/perl -w
use Digest::MD5 qw(md5_hex);

$cksum=md5_hex("heilllo");
$cksum2=md5_hex("helllo");
print $cksum;
print "\n";
print $cksum2;
