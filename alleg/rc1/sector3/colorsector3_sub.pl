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

&moneysetting("exp",0,4,5,2);

sub moneysetting(){
	my ($category,$tr,$t,$r,$s)=@_;

if($category=~/tac/){
	$img->fill(196,157,$blue);
}
if($category=~/exp/){
	$img->fill(196,163,$black);
}
if($category=~/sup/){
	$img->fill(196,169,$red);
}


#tr
my $k=0;
while($tr>0){
	$img->fill(223,157+($k*6),$red);
	$tr--;$k++;
}


#t
$k=0;
while($t>0){
	$img->fill(235,157+($k*6),$red);
	$t--;$k++;
}

#r
$k=0;
while($r>0){
	$img->fill(247,157+($k*6),$blue);
	$r--;$k++;
}

#s
$k=0;
while($s>0){
	$img->fill(259,157+($k*6),$blue);
	$s--;$k++;
}

}

print OUTPUTPNG $img->png;
