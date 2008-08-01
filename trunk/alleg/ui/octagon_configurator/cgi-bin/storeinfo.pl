#!/usr/bin/perl -w

use CGI qw(:standard);

print header,start_html;


$x=param('form_x');
$y=param('form_y');
$name=param('name');

$x1=$x-15;
$y1=$y-15;
$x2=$x+16;
$y2=$y+14;

open(OUTPUT,">>output.txt");

print OUTPUT qq^<area shape=rect coords=\"$x1,$y1,$x2,$y2\" href="javascript:alert('$name')">\n^;
print qq^<meta http-equiv="REFRESH" content="0;url=../index.html">^; 
print end_html;

