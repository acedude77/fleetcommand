#!/usr/bin/perl -w
use CGI qw(:standard);
use DBI;

my $user='alleguser';
my $pass='pZbDdzuW.tmXMvqX';
my $dsn='dbi:mysql:alleg:localhost:3306';
my $dbh=DBI->connect($dsn,$user,$pass);

my $sth=$dbh->prepare('select id as sectorid,sector_name,backgrounds,icons from afcoc order by timestamp desc');
$sth->execute();

print header,start_html;

print "<a href='../generate_octagons.pl'>generate octagons</a><br>";
print "<a href='display.pl'>back to global map</a>";

print "<table border='1'>\n";
print "<tr><th>sector id</th><th>sector name</th><th>backgrounds</th><th>icons</th></tr>\n";

while(($sectorid,$sector_name,$backgrounds,$icons)=$sth->fetchrow_array()){
	print "<tr><td><a href='cleardb.pl?$sectorid'>$sectorid</a></td><td>$sector_name</td><td>$backgrounds</td><td>$icons</td></tr>\n";
}

print "</table>\n";

print end_html;



