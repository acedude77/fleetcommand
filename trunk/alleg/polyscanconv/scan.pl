#!/usr/bin/perl -w

use GD;

$img = newFromPng GD::Image('triangle.png');

($width,$height)=$img->getBounds();

print "width: $width\nheight: $height\n";


foreach $x (0..$width){
	foreach $y (0..$height){
		$index=$img->getPixel($x,$y);
		($r,$g,$b) = $img->rgb($index);
		if($r==12&&$g==10&&$b==12){
			print "*";
		}else{
			print " ";
		}
#		print "index: $index\n";
#		print "$r $g $b\n";
	}
	print "\n";
}
