#!/usr/bin/perl -w

use GD;
my $height=200;
my $width=200;
my $xgridsize=10;
my $ygridsize=10;

my $img = new GD::Image($height,$width,1);
my $black=$img->colorAllocate(0,0,0);
$img->fill(0,0,$black);

my $stars=30;

while($stars > 0){
	my $xrand=rand($width+1);
	my $yrand=rand($height+1);





open(OUTPUTPNG,">output.png");
print OUTPUTPNG $img->png;
close OUTPUTPNG;
