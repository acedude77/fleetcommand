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


my $sth=$dbh->prepare('select sector_name,backgrounds,location,eyed from afcoc');

$sth->execute();


$img = newFromGif GD::Image('../map1024tbak2.gif');
open(OUTPUT,">../overlay.png");

#$img->copy(newFromGif GD::Image('/home/jctong/workarea/afcmg/sector3EmptyMoneyTechIcons.gif'),0,0,0,0,300,300);

my $yellow = $img->colorAllocate(255,255,0);
my $blue = $img->colorAllocate(0,0,255);
my $grey = $img->colorAllocate(205,201,201);
my $red = $img->colorAllocate(255,0,0);


my @x=(0,5,10,10,5,-5,-10,-10,-5);
my @y=(0,-10,-5,5,10,10,5,-5,-10);

print header,start_html;

while(my($sector_name,$backgrounds,$location,$eyed)=$sth->fetchrow_array()){

	my($x,$y)=split(/,/,$location);
	@backgrounds=split(/ /,$backgrounds);
	foreach my $background (@backgrounds){
		$background =~s/^\s//;
		$background =~s/\s$//;
		if($background ne ""){
			$background=~/sector(\d)Background(\w+)\.gif/;
			my $sector=$1;
			my $color=$2;
		
			$fillx=$x+$x[$sector];
			$filly=$y+$y[$sector];
			if($color eq 'Blue'){
				$img->fill($fillx,$filly,$blue);
			}elsif($color eq 'Yellow'){
				$img->fill($fillx,$filly,$yellow);
			}elsif($color eq 'Grey'){
				$img->fill($fillx,$filly,$grey);
			}
			print "$sector_name $x $y $fillx $filly done<br>\n";
		}
	}
	if($eyed eq 'yes'){
		$img->filledEllipse($x,$y,8,8,$red);
		print "marked $sector_name eyed<br>\n";
	}
}

print OUTPUT $img->png;

print "<a href='display.pl'>back to global map</a><br>";
print "<a href='showdb.pl'>back to show db & generate octagons</a><br>";
print end_html;
