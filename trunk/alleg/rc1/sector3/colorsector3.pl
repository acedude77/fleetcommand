#!/usr/bin/perl -w
 
use GD;
use GD::Simple;

open(OUTPUTPNG,">output.png");

# create a new image
$img = GD::Simple->new(300,300);

$img1 = newFromGif GD::Image('examplemoneysettingsgb3.gif');

$img->copy($img1,0,0,0,0,300,300);

# allocate some colors
#$white = $img->colorAllocate(255,255,255);
#$black = $img->colorAllocate(0,0,0);       
#$red = $img->colorAllocate(255,0,0);      
$blue = $img->colorAllocate(0,0,255);

$img->fill(218,157,$blue);




print OUTPUTPNG $img->png;
