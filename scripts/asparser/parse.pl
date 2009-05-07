#!/usr/bin/perl -w

use DBI;
use CGI qw(:standard);

system("wget --quiet http://leaderboard.alleg.net -O /tmp/index.html");

open(INPUT,"/tmp/index.html");
my $string="";
my $dbh=DBI->connect('DBI:mysql:allegskill','root','asdfjk');

$dbh->do("update stats set status=0");

while(my $line=<INPUT>){
	if($line=~/<\/td><td align="right">/){
		$line=~s/<\/td>/ /g;
		$line=~s/<td>/ /g;
		$line=~s/<td align="right">/ /g;
		$line=~s/<td class="Rating" align="right">/ /g;
		$line=~s/\s+/,/g;
		$line=~s/,(\D+\w*),/,"$1",/;
		$line=~s/^,//;$line=~s/,$//;
		chomp($line);
		$string="insert into stats values (null,".$line.",null,1);";
		$dbh->do($string);
	}
}

system("mv /tmp/index.html /tmp/index.html.old");

my $columns="callsign,drn_kills";
#my $sth=$dbh->prepare("select $columns from stats where status=1 order by drn_kills desc limit 10");
my $sth=$dbh->prepare("select $columns from stats where status=1 order by drn_kills desc limit 10");
$sth->execute();

my @cols=split(/,/,$columns);

print header;
print start_html;
print "<table border=1>";

print "<tr>";
foreach my $col (@cols){
	print "<th>$col</th>";
}
print "</tr>";

while(my @row=$sth->fetchrow_array()){
	print "<tr>";
	foreach my $item (@row){
		print "<td>$item</td>";
	}
	print "</tr>";
}
print "</table>";
print "</html>";
