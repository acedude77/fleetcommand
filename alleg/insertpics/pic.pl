#!/usr/bin/perl -w

use GD;
use GD::Simple;

open(OUTPUT,">a.png");

# create a new image
$img = GD::Simple->new(400,400);

$img2 = newFromPng GD::Image('plogo.png');



#background color
$img->bgcolor('darkblue');
$img->clear;


#border
$img->moveTo(10,10);
$img->fgcolor('white');
$img->lineTo(390,10);
$img->lineTo(390,390);
$img->lineTo(10,390);
$img->lineTo(10,10);

#vertical lines
$numberOfCols=6;
$xstep=380/$numberOfCols;

$x=1;
while($x<$numberOfCols){
	$img->moveTo(10+($xstep*$x),10);
	$img->lineTo(10+($xstep*$x),390);
	$x++;
}


#horizontal lines
$numberOfRows=6;
$ystep=380/$numberOfRows;

$y=1;
while($y<$numberOfRows){
	$img->moveTo(10,10+($ystep*$y));
	$img->lineTo(390,10+($ystep*$y));
	$y++;
}


$x=3;$y=4;

$x1=10+($xstep*$x);
$y1=10+($ystep*$y);




$img->copy($img2,0,0,0,0,160,120); 
$img->copy($img2,$x1,$y1,0,0,160,120); 

print OUTPUT $img->png;
