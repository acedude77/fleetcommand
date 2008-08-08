#!/usr/bin/perl -w

use DBI;
use GD;
use GD::Simple;

my $user='root';
my $pass='';
my $dsn='dbi:mysql:alleg:localhost:3306';
my $dbh=DBI->connect($dsn,$user,$pass);


my $sth=$dbh->prepare('select sector_name,available_techs,treasures,total_cash,resources,starting_cash from afcoc where id=1');

$sth->execute();

while(($sector_name,$available_techs,$treasures,$total_cash,$resources,$starting_cash)=$sth->fetchrow_array()){
	$filename=$sector_name.".png";
	open(OUTPUT,">$filename");
	my $img = newFromGif GD::Image('/home/jctong/workarea/afcmg/blancOctagon.gif');
	print OUTPUT $img->png;
}
