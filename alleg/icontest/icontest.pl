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


#sample circle
$x=1; $y=1;
$x1=10+($xstep*$x);
$y1=10+($ystep*$y);
$img->moveTo($x1,$y1);
$img->bgcolor('white');
$img->fgcolor('white');
$img->ellipse(20,20);


#sample rectangle
$x=1;
$y=2;

$x1=10+($xstep*$x);
$y1=10+($ystep*$y);
$img->moveTo($x1,$y1);
$img->bgcolor('white');
$img->fgcolor('white');
$img->rectangle($x1-10,$y1-10,$x1+10,$y1+10);


#sample triangle
$x=2;
$y=1;

$x1=10+($xstep*$x);
$y1=10+($ystep*$y);

my $triangle= new GD::Polygon;
$y2=$y1-4*(3^.5);
$x2r=$x1+4*(3^.5);
$x2l=$x1-4*(3^.5);

$triangle->addPt($x1,$y2);
$triangle->addPt($x2r,$y1+10);
$triangle->addPt($x2l,$y1+10);
$img->bgcolor('white');
$img->fgcolor('white');
$img->polygon($triangle);


#sample pacman
$x=2; $y=2;

$white=$img->colorAllocate(255,255,255);

$x1=10+($xstep*$x);
$y1=10+($ystep*$y);

$img->moveTo($x1,$y1);
$img->fgcolor('white');
$img->filledArc($x1,$y1,20,20,30,330,$white,gdEdged);


print $img->png;
