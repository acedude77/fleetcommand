#!/usr/bin/perl -w
use CGI qw(:standard);
use DBI;

my $user='alleguser';
my $pass='pZbDdzuW.tmXMvqX';
my $dsn='dbi:mysql:alleg:localhost:3306';
my $dbh=DBI->connect($dsn,$user,$pass);

my $sth=$dbh->prepare('update afcoc_scions set backgrounds="", icons="" where id=?');
$sth->execute(@ARGV);

print header,start_html;

print "cleared sectorid: @ARGV<br>";
print "<a href='showdb.pl'>back to showdb</a>";

print end_html;



