#!/usr/bin/perl -w
 
use GD;
use GD::Simple;

open(OUTPUTPNG,">constellationoctagon.png");

# create a new image
$img = GD::Simple->new(1000,1300);

$img1 = newFromGif GD::Image('constellations.gif');
$img2 = newFromGif GD::Image('octagon_empty_sample.gif');
$img3 = newFromGif GD::Image('octagon_filled_sector_1.gif');
$img4 = newFromGif GD::Image('octagon_filled_sector_6.gif');

$img->copy($img1,0,0,0,0,1000,1300);
$img->copy($img2,0,0,0,0,300,300); 
$img->copy($img3,0,0,0,0,300,300); 
$img->copy($img4,0,0,0,0,300,300); 



$img->copy($img2,500,500,0,0,300,300); 
$img->copy($img3,500,500,0,0,300,300); 
$img->copy($img4,500,500,0,0,300,300); 


print OUTPUTPNG $img->png;
