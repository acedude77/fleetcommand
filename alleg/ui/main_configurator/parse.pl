#!/usr/bin/perl

use File::Basename;
use Data::Dumper;
use CGI qw(:standard);

#require "/home/jctong/workarea/svn/alleg/ui/main_configurator/testoct.pm";
require "/home/jctong/workarea/afcmg/testoct.pm";

print header,start_html;

$a=param('data');

&main($a);

print end_html;




sub main{

	my($webinput)=@_;	
	local @input=split(/\n/,$webinput);

#	my $background="constellation_background_image.gif";
#	local $xgridsize=75;
#	local $ygridsize=75;
	open(OUTPUTPNG,">/var/www/afcmg/output.png") or die('cant output');

#	my $img_background = newFromGif GD::Image($background); 
#	my ($width,$height)=$img_background->getBounds();
#	local $img=GD::Simple->new($width,$height);
#	#&placeGrid($width,$height,$xgridsize,$ygridsize);
#	$blue=$img->colorAllocate(0,0,255);

	my %componentDB=&createComponentDB;
	my %config;
	my $msettings;
	my ($exp,$tac,$sup,$min,$tr,$t,$r,$s);
	my ($savetr,$savet,$saver,$saves);
	
	foreach my $line (@input){
		my($x,$y,$sector,$icon,$color,$num,$upg);
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

		#draw lines first (before octagons)
		if($sector==0){
			drawLine($x,$y,$icon,$color);
			next;
		}

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
		}elsif($icon=~/emti/i){
			$icon="EmptyMoneyTechIcons";
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

		if($exp==1){
			$msettings=$msettings."exp ";
		}
		if($tac==1){
			$msettings=$msettings."tac ";
		}
		if($sup==1){
			$msettings=$msettings."sup ";
		}
		if($min==1){
			$msettings=$msettings."min ";
		}
		if($tr ne ""){
			$savetr=$tr;
		}
		if($t ne ""){
			$savet=$t;
		}
		if($r ne ""){
			$saver=$r;
		}
		if($s =~ /(\d)/){
			$saves=$1;
		}
		if($sector==8){
			&placeOctagon($x,$y,\%config,\%componentDB);
			&moneysetting($x,$y,$msettings,$savetr,$savet,$saver,$saves);	
			%config=();
			$msettings="";
			($exp,$tac,$sup,$min,$tr,$t,$r,$s)=0;
			($savetr,$savet,$saver,$saves)=0;
		}	
	}

print OUTPUTPNG $img->png;

}
