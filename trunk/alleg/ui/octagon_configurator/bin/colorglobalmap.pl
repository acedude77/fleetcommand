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


my $sth=$dbh->prepare('select sector_name,backgrounds,visibility,location from afcoc');

$sth->execute();


$img = newFromGif GD::Image('../map1024tbak2.gif');
open(OUTPUT,">/tmp/a.png");

#$img->copy(newFromGif GD::Image('/home/jctong/workarea/afcmg/sector3EmptyMoneyTechIcons.gif'),0,0,0,0,300,300);

my $yellow = $img->colorAllocate(255,250,205);
my $blue = $img->colorAllocate(0,0,255);

while(my($sector_name,$backgrounds,$visibility,$location)=$sth->fetchrow_array()){

	@backgrounds=split(/ /,$backgrounds);
	foreach my $background (@backgrounds){
		$background =~s/^\s//;
		$background =~s/\s$//;
		if($background ne ""){
			$background=~/sector(\d)Background(\w+)\.gif/;
			my($x,$y)=split(/,/,$location);
			$fillx=$x-10;
			$filly=$y-5;
			$img->fill($fillx,$filly,$blue);
			print "$sector_name $x $y $fillx $filly done\n";
		}
	}


}

print OUTPUT $img->png;

#print header,start_html;
#print "octagons generated<br>";
#print "<a href='bin/display.pl'>back to global map</a><br>";
#print "<a href='bin/showdb.pl'>back to show db</a><br>";
#print end_html;
