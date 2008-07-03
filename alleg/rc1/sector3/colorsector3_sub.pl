#!/usr/bin/perl -w
 
use GD;
use GD::Simple;

open(OUTPUTPNG,">output.png");

# create a new image
$img = GD::Simple->new(300,300);

$img1 = newFromGif GD::Image('sector3EmptyMoneyTechIcons.gif');

$img->copy($img1,0,0,0,0,300,300);

# allocate some colors
#$white = $img->colorAllocate(255,255,255);
$black = $img->colorAllocate(0,0,0);       
$red = $img->colorAllocate(255,0,0);      
$blue = $img->colorAllocate(0,0,255);

sub moneysetting(){
	my ($category,$value)=@_;

#tac
$img->fill(196,157,$blue);
#exp
$img->fill(196,163,$black);
#sup
$img->fill(196,169,$red);

#tr
$img->fill(223,157,$red);
$img->fill(223,163,$red);
$img->fill(223,169,$red);

#t
$j=0;
while($j<8){
	$img->fill(235,157+($j*6),$red);
	$j++;
}

#r
$j=0;
while($j<8){
	$img->fill(247,157+($j*6),$blue);
	$j++;
}

#s
$j=0;
while($j<7){
	$img->fill(259,157+($j*6),$blue);
	$j++;
}

}

print OUTPUTPNG $img->png;
