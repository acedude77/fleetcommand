#!/usr/bin/perl -w

use CGI qw(:standard);

print header,start_html;


$x=param('form_x');
$y=param('form_y');
$sector=param('sector');
$color=param('color');
$baseicon=param('baseicon');
$constructor=param('constructor');
$one=param('one');
$two=param('two');
$outpost=param('outpost');
$shipyard=param('shipyard');
$sup=param('sup');
$tac=param('tac');
$garr=param('garr');
$upg1=param('upg1');
$upg2=param('upg2');

#$x1=$x-15;
#$y1=$y-15;
#$x2=$x+16;
#$y2=$y+14;

open(OUTPUT,">>output.txt");

#print OUTPUT qq^<area shape=rect coords=\"$x1,$y1,$x2,$y2\" href="javascript:alert('$sector')">\n^;
print OUTPUT qq^<area shape=rect coords=\"$x,$y\" href="javascript:alert('$sector')">\n^;
print qq^<meta http-equiv="REFRESH" content="0;url=../index.html">^; 
print end_html;

