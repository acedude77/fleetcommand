#!/usr/bin/perl -w
use Digest::MD5 qw(md5_hex);


$input=`grep -v "<Date>" scores-2008-6-28_14.25.xml`;

$cksum=md5_hex($input);




#$cksum=md5_hex("heilllo");
#$cksum2=md5_hex("helllo");
print $cksum;
