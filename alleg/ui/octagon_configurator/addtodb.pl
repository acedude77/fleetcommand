#!/usr/bin/perl -w

use DBI;

my $user='root';
my $pass='';
my $dsn='dbi:mysql:alleg:localhost:3306';
my $dbh=DBI->connect($dsn,$user,$pass);

open(INPUT,"locations.txt");
while(defined(my $line=<INPUT>)){
	

my $sth=$dbh->prepare('select sector_name,location from afcoc');
$sth->execute();

while(@row=$sth->fetchrow_array()){

}

