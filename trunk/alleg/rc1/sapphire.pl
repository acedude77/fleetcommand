#!/usr/bin/perl -w

use GD::Simple;


open(OUTPUT,">a.png");

# create a new image
$img = GD::Simple->new(900,700);

#background color
$img->bgcolor('gray');
$img->clear;


#border
#$img->moveTo(10,10);
#$img->fgcolor('white');
#$img->lineTo(390,10);
#$img->lineTo(390,390);
#$img->lineTo(10,390);
#$img->lineTo(10,10);

#vertical lines
$numberOfCols=9;
$xstep=900/$numberOfCols;

$x=1;
while($x<$numberOfCols){
	$img->moveTo($xstep*$x,0);
	$img->lineTo($xstep*$x,700);
	$x++;
}


#horizontal lines
$numberOfRows=7;
$ystep=700/$numberOfRows;

$y=1;
while($y<$numberOfRows){
	$img->moveTo(0,$ystep*$y);
	$img->lineTo(900,$ystep*$y);
	$y++;
}


&drawLine(4.5,1,2.5,2); &drawLine(4.5,1,6.5,2);
&drawLine(4.5,1,3.5,2.5); &drawLine(4.5,1,5.5,2.5);
&drawLine(2.5,2,1,3.5); &drawLine(6.5,2,8,3.5);

&drawLine(1,3.5,2.5,3.5); &drawLine(6.5,3.5,8,3.5);


#sample regular hexagon

&drawHexagon(4.5,1,25);

&drawHexagon(2.5,2,25);
&drawHexagon(6.5,2,25);

&drawHexagon(3.5,2.5,25);
&drawHexagon(5.5,2.5,25);

&drawHexagon(1,3.5,25);
&drawHexagon(2.5,3.5,25);
&drawHexagon(4.5,3.5,25);
&drawHexagon(6.5,3.5,25);
&drawHexagon(8,3.5,25);

&drawHexagon(3.5,4.5,25);
&drawHexagon(5.5,4.5,25);

&drawHexagon(2.5,5,25);
&drawHexagon(6.5,5,25);

&drawHexagon(4.5,6,25);

sub drawLine{
	my($startx,$starty,$endx,$endy)=@_;
	$startx=$startx*$xstep;
	$endx=$endx*$xstep;
	$starty=$starty*$ystep;
	$endy=$endy*$ystep;

	$img->moveTo($startx,$starty);
	$img->lineTo($endx,$endy);
}

sub drawHexagon{
#radius = edge for regular hex

	my ($x,$y,$radius)=@_;
	$x=$x*$xstep;
	$y=$y*$ystep;
	my $hexagon= new GD::Polygon;

	my $b=$radius * (.75**.5);

	$hexagon->addPt($x+$radius,$y);
	$hexagon->addPt($x+(.5*$radius),$y+$b);
	$hexagon->addPt($x-(.5*$radius),$y+$b);
	$hexagon->addPt($x-$radius,$y);
	$hexagon->addPt($x-(.5*$radius),$y-$b);
	$hexagon->addPt($x+(.5*$radius),$y-$b);

	$img->fgcolor('white');
	$img->bgcolor('white');
	$img->polygon($hexagon);
	
#lines from center
	$img->fgcolor('black');
	$img->moveTo($x,$y);
	$img->lineTo($x+$radius,$y);	
	$img->moveTo($x,$y);
	$img->lineTo($x+(.5*$radius),$y+$b);
	$img->moveTo($x,$y);
	$img->lineTo($x-(.5*$radius),$y+$b);
	$img->moveTo($x,$y);
	$img->lineTo($x-$radius,$y);	
	$img->moveTo($x,$y);
	$img->lineTo($x-(.5*$radius),$y-$b);
	$img->moveTo($x,$y);
	$img->lineTo($x+(.5*$radius),$y-$b);

}


print OUTPUT $img->png;
