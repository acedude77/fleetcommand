#!/usr/bin/perl -w
 
use GD;
use GD::Simple;

open(OUTPUTPNG,">constellationoctagon.png");

# create a new image
$img = GD::Simple->new(1000,1300);

$img1 = newFromGif GD::Image('constellations.gif');
$img2 = newFromGif GD::Image('octagontestcolordh0.gif');
$img3 = newFromGif GD::Image('OctetPartBlue.gif');

$img->copy($img1,0,0,0,0,1000,1300);
$img->copy($img2,0,0,0,0,300,300); 
$img->copy($img3,0,0,0,0,99,139); 


print OUTPUTPNG $img->png;
