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

while(($sector_name,$backgrounds,$visibility,$location)=$sth->fetchrow_array()){


	$img = newFromGif GD::Image('/home/jctong/workarea/afcmg/sector3Grey.gif');
	$img->copy(newFromGif GD::Image('/home/jctong/workarea/afcmg/sector3EmptyMoneyTechIcons.gif'),0,0,0,0,300,300);


	@backgrounds=split(/ /,$backgrounds);
	foreach my $background (@backgrounds){
		$background =~s/^\s//;
		$background =~s/\s$//;
		if($background ne ""){
			
			$img->copy(newFromGif GD::Image($file),0,0,0,0,300,300);
		}
	}


	print OUTPUT $img->png;
}

print header,start_html;
print "octagons generated<br>";
print "<a href='bin/display.pl'>back to global map</a><br>";
print "<a href='bin/showdb.pl'>back to show db</a><br>";
print end_html;
