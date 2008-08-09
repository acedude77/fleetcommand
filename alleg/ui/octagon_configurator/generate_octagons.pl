#!/usr/bin/perl -w

use DBI;
use GD;
use GD::Simple;
require "/home/jctong/workarea/afcmg/testoct.pm";

my $user='root';
my $pass='';
my $dsn='dbi:mysql:alleg:localhost:3306';
my $dbh=DBI->connect($dsn,$user,$pass);


my $sth=$dbh->prepare('select sector_name,available_techs,treasures,total_cash,resources,starting_cash from afcoc');

$sth->execute();

while(($sector_name,$available_techs,$treasures,$total_cash,$resources,$starting_cash)=$sth->fetchrow_array()){
	$filename=$sector_name.".png";
	open(OUTPUT,">$filename");
	$img = newFromGif GD::Image('/home/jctong/workarea/afcmg/sector3Grey.gif');
	$img->copy(newFromGif GD::Image('/home/jctong/workarea/afcmg/sector3EmptyMoneyTechIcons.gif'),0,0,0,0,300,300);

	&moneysetting2(0,0,$available_techs,$treasures,$total_cash,$resources,$starting_cash);

	print OUTPUT $img->png;
}
