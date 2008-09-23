#!/usr/bin/perl -w
use CGI qw(:standard);
use DBI;

my $user='alleguser';
my $pass='pZbDdzuW.tmXMvqX';
my $dsn='dbi:mysql:alleg:localhost:3306';
my $dbh=DBI->connect($dsn,$user,$pass);

my $sth=$dbh->prepare('select id,location,sprite_type,team,visibility from sprites order by timestamp desc');
$sth->execute();

print header,start_html;

print "<a href='../generate_octagons.pl'>generate octagons</a><br>";
print "<a href='display.pl'>back to global map</a><br>";
print "<a href='colorglobalmap.pl'>update global overlay</a><br>";

print "<table border='1'>\n";
print "<tr><th>id</th><th>location</th><th>sprite_type</th><th>team</th><th>visibility</th></tr>\n";

while(($id,$location,$sprite_type,$team,$visibility)=$sth->fetchrow_array()){
	print "<tr><td><a href='clearspritesdb.pl?$id'>$id</a></td><td>$location</td><td>$sprite_type</td><td>$team</td><td>$visibility</td></tr>\n";
}

print "</table>\n";

print end_html;
