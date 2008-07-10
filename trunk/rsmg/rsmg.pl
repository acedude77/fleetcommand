#!/usr/bin/perl -w

use GD;
use CGI qw(:standard);

my $height=param('height');
my $width=param('width');
my $stars=param('stars');

my $img = new GD::Image($width,$height,1);

my $black=$img->colorAllocate(0,0,0);
my $white=$img->colorAllocate(255,255,255);

$img->fill(0,0,$black);

while($stars > 0){
	my $xrand=rand($width+1);
	my $yrand=rand($height+1);
	my $size=rand(5);

	$color=$img->colorAllocate(rand(256),rand(256),rand(256));
	
	$img->filledEllipse($xrand,$yrand,$size,$size,$color);
	$stars--;
}




open(OUTPUTPNG,">/var/www/rsmg/output.png") or die "$!";
print OUTPUTPNG $img->png;
close OUTPUTPNG;

print header,start_html;
print "<img src='/rsmg/output.png'>";
print end_html;
