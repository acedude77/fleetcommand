#!/usr/bin/perl

use File::Basename;
use Data::Dumper;
use CGI qw(:standard);

#require "/home/jctong/workarea/svn/alleg/ui/main_configurator/testoct.pm";
require "/home/jctong/workarea/afcmg/testoct.pm";

#file upload
$CGI::POST_MAX=1024*5000;
my $safe_filename_characters = "a-zA-Z0-9_.-";
my $upload_dir="/var/www/afcmg/tmp";
$newbackground=param("newbackground");
if($newbackground ne ""){
	my($name,$path,$extension)=fileparse($newbackground, '\..*');
	$newbackground=$name.$extension;
	$newbackground=~tr/ /_/;
	$newbackground=~s/[^$safe_filename_characters]//g;
	$newbackgroundfh=upload("newbackground");
	open(NEWBACKGROUND,">$upload_dir/$newbackground") or die "$!";
	binmode NEWBACKGROUND;
	while(<$newbackgroundfh>){
		print NEWBACKGROUND;
	}
	close NEWBACKGROUND;
}


print header,start_html;

$a=param('data');
$gridlines=param('gridlines');

if($newbackground eq ""){
	open(BACKGROUND,"/home/jctong/workarea/afcmg/constellation_background_image.gif");
	$img_background = newFromGif GD::Image(\*BACKGROUND); 
	close(BACKGROUND);
}else{
	open(BACKGROUND,"/$upload_dir/$newbackground");
	$img_background = newFromPng GD::Image(\*BACKGROUND); 
	close(BACKGROUND);
}

	my ($width,$height)=$img_background->getBounds();
	$img=GD::Simple->new($width,$height,1);
	$img->copy($img_background,0,0,0,0,$width,$height);

	$xgridsize=75;
	$ygridsize=75;
	
	if($gridlines){
		&placeGrid($width,$height,$xgridsize,$ygridsize);
	}

	$blue=$img->colorAllocate(0,0,255);
	$black=$img->colorAllocate(0,0,0);

&main($a);

print "<img src='/afcmg/output.png' width='100%'>";


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

