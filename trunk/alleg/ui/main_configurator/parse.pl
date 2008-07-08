#!/usr/bin/perl

use CGI qw(:standard);

require "/home/jctong/workarea/svn/alleg/ui/main_configurator/testoct.pm";

print header,start_html;

$a=param('data');

#$a=~s/\n/<br>/g;
#$a=~s/\t/-/g;
#print $a;

&main($a);



print end_html;




sub main{

	my($webinput)=@_;	
	    #output filename
    my $outputpng="output.png";

    #background image
    my $background="constellation_background_image.gif";
    #grid sizes
    local $xgridsize=75;
    local $ygridsize=75;

#create a database of available .gif icon components
    local %componentDB=&createComponentDB;
#    print "$componentDB{7}{One}";

#output filehandle
    open(OUTPUTPNG,">$outputpng");

#create an image same size as the background and place background on it
    my $img_background = newFromGif GD::Image($background);
    ($width,$height)=$img_background->getBounds();
    # create a new image
        #third arg=1 for truecolor

    local $img = GD::Simple->new($width,$height,1);
    $img->copy($img_background,0,0,0,0,$width,$height);

#add grid
    &placeGrid($width,$height,$xgridsize,$ygridsize);

#colors
#$black = $img->colorAllocate(0,0,0);
#$red = $img->colorAllocate(255,0,0);
$blue = $img->colorAllocate(0,0,255);
#$green = $img->colorAllocate(0,255,0);
#$yellow = $img->colorAllocate(255,250,205);

local @input=split(/\n/,$webinput);

foreach my $line (@input){
	my @items=split(/\t/,$line);
	my($x,$y,$sector,$icon,$color,$num,$upg,$exp,$tac,$sup,$min,$tr,$t,$r,$s);
	$x=$items[0];
	$y=$items[1];
	$sector=$items[2];
	$icon=$items[3];
	$color=$items[4];
	$num=$items[5];
	$upg=$items[6];
	$exp=$items[7];
	$tac=$items[8];
	$sup=$items[9];
	$min=$items[10];
	$tr=$items[11];
	$t=$items[12];
	$r=$items[13];
	$s=$items[14];

	if($icon=~/baseicon/i){
		$icon="BaseIcon";
	}elsif($icon=~/garr/i){
		$icon="Garr";
	}elsif($icon=~/outpost/i){
		$icon="Outpost";
	}elsif($icon=~/shipyard/i){
		$icon="Shipyard";
	}elsif($icon=~/sup/i){
		$icon="Sup";
	}elsif($icon=~/tac/i){
		$icon="Tac";
	}else{
		$icon="";
	}
	if($color=~/blue/i){
		$color="Blue";
	}elsif($color=~/yellow/i){
		$color="Yellow";
	}elsif($color=~/grey/i){
		$color="Grey";
	}else{
		$color="";
	}
	if($num=~/one/i){
		$num="One";
	}elsif($num=~/two/i){
		$num="Two";
	}else{
		$num="";
	}
	if($upg=~/upgradeonce/i){
		$upg="UpgradeOnce";
	}elsif($upg=~/upgradetwice/i){
		$upg="UpgradeTwice";
	}else{
		$upg="";
	}
	
	my %config;

	if($color ne ""){
		$config{$sector}{$color}="";
	}	
	if($icon ne ""){
		$config{$sector}{$icon}="";
	}
	if($upg ne ""){
		$config{$sector}{$upg}="";
	}	
	if($num ne ""){
		$config{$sector}{$num}="";
	}

	&placeOctagon($x,$y,\%config);



}




#place a test octagon
#print OUTPUTPNG $img->png;

}



__END__

open(INPUT,"input");
while(<INPUT>){
	chomp($_);
	my @input=split(/\t/,$_);
	foreach my $item (@input){
		print "$item ";
	}
	print "\n";
}
