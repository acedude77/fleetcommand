#!/usr/bin/perl

use Data::Dumper;
use CGI qw(:standard);

require "/home/jctong/workarea/svn/alleg/ui/main_configurator/testoct.pm";

print header,start_html;

$a=param('data');

&main($a);

print end_html;




sub main{

	my($webinput)=@_;	
	local @input=split(/\n/,$webinput);

	my $background="constellation_background_image.gif";
	local $xgridsize=75;
	local $ygridsize=75;
	local %componentDB=&createComponentDB;
	open(OUTPUTPNG,">output.png");
	my $img_background = newFromGif GD::Image($background); 
	my ($width,$height)=$img_background->getBounds();
	local $img=GD::Simple->new($width,$height);
	#&placeGrid($width,$height,$xgridsize,$ygridsize);
	$blue=$img->colorAllocate(0,0,255);



	my %config;
	
	foreach my $line (@input){
		my($x,$y,$sector,$icon,$color,$num,$upg,$exp,$tac,$sup,$min,$tr,$t,$r,$s);
		my @items=split(/\t/,$line);
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
		print "$sector<br>";
		if($sector==8){
			print Dumper(\%config);	
			&placeOctagon(10,10,\%config);
			

			%config=();
		}	
	}

#place a test octagon
print OUTPUTPNG $img->png;

}

