#!/usr/bin/perl -w

use CGI qw(:standard);
use DBI;
use GD;
use GD::Simple;
require "/home/jctong/workarea/afcmg/testoct.pm";

my $user='alleguser';
my $pass='pZbDdzuW.tmXMvqX';
my $dsn='dbi:mysql:alleg:localhost:3306';
my $dbh=DBI->connect($dsn,$user,$pass);


my $sth=$dbh->prepare('select sector_name,available_techs,treasures,total_cash,resources,starting_cash,map,backgrounds,icons from afcoc');

$sth->execute();

while(($sector_name,$available_techs,$treasures,$total_cash,$resources,$starting_cash,$map,$backgrounds,$icons)=$sth->fetchrow_array()){
	$filename=$sector_name.".png";
	open(OUTPUT,">$filename");
	$img = newFromGif GD::Image('/home/jctong/workarea/afcmg/sector3Grey.gif');
	$img->copy(newFromGif GD::Image('/home/jctong/workarea/afcmg/sector3EmptyMoneyTechIcons.gif'),0,0,0,0,300,300);
	$img->copy(newFromGif GD::Image('/home/jctong/workarea/afcmg/blancOctagon.gif'),0,0,0,0,300,300);

	&moneysetting2(0,0,$available_techs,$treasures,$total_cash,$resources,$starting_cash);

	&labelsector(5,2,$sector_name);
	&labelsector(5,280,$map);

	@backgrounds=split(/ /,$backgrounds);
	foreach my $background (@backgrounds){
		$background =~s/^\s//;
		$background =~s/\s$//;
		if($background ne ""){	
			$file="/home/jctong/workarea/afcmg/$background";
			$img->copy(newFromGif GD::Image($file),0,0,0,0,300,300);
		}
	}

	@icons=split(/ /,$icons);
	foreach my $icon (@icons){
		$icon =~s/^\s//;
		$icon =~s/\s$//;
		if($icon ne ""){	
			$file="/home/jctong/workarea/afcmg/$icon";
			$img->copy(newFromGif GD::Image($file),0,0,0,0,300,300);
		}
	}

#grey backgrounds only (to erase)
	@backgrounds=split(/ /,$backgrounds);
	foreach my $background (@backgrounds){
		$background =~s/^\s//;
		$background =~s/\s$//;
		if($background=~/Grey/){	
			$file="/home/jctong/workarea/afcmg/$background";
			$img->copy(newFromGif GD::Image($file),0,0,0,0,300,300);
		}
	}

	print OUTPUT $img->png;
}

print header,start_html;
print "octagons generated<br>";
print "<a href='bin/display.pl'>back to global map</a><br>";
print "<a href='bin/showdb.pl'>back to show db</a><br>";
print "<a href='bin/colorglobalmap.pl'>update global overlay</a><br>";
print end_html;
