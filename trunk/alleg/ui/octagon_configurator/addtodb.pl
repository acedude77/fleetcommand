#!/usr/bin/perl -w

use DBI;

my $user='root';
my $pass='';
my $dsn='dbi:mysql:alleg:localhost:3306';
my $dbh=DBI->connect($dsn,$user,$pass);



my $sth=$dbh->prepare('update afcoc set location=? where sector_name=?');

open(INPUT,"locations.txt");
while(defined(my $line=<INPUT>)){
	@temp=split(/\s/,$line);
	$coords=pop(@temp);

	foreach $item (@temp){
		$x=ucfirst($item);
		push(@fixed,$x);
	}
	$sector_name="@fixed";
	undef(@fixed);
	print "$coords $sector_name\n";	
	$sth->execute($coords,$sector_name);

#while(@row=$sth->fetchrow_array()){

#}
}
