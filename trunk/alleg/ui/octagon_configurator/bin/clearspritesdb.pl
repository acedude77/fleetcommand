#!/usr/bin/perl -w
use CGI qw(:standard);
use DBI;

my $user='alleguser';
my $pass='pZbDdzuW.tmXMvqX';
my $dsn='dbi:mysql:alleg:localhost:3306';
my $dbh=DBI->connect($dsn,$user,$pass);

my $sth=$dbh->prepare('delete from sprites where id=?');
$sth->execute(@ARGV);

print header,start_html;

print "cleared id: @ARGV<br>";
print "<a href='showspritesdb.pl'>back to showspritesdb</a>";

print end_html;
