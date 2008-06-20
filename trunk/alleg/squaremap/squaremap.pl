#!/usr/bin/perl -w

use GD::Simple;

# create a new image
$img = GD::Simple->new(400,400);

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


#sample icon
$x=1;
$y=2;

$x1=10+($xstep*$x);
$y1=10+($ystep*$y);
$img->moveTo($x1,$y1);
$img->bgcolor('white');
$img->fgcolor('white');
$img->ellipse(20,20);


print $img->png;
