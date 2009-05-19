#!/usr/bin/perl -w

use DBI;
use CGI qw(:standard);

system("wget --quiet http://leaderboard.alleg.net -O /tmp/index.html");

open(INPUT,"/tmp/index.html");
my $string="";
my $dbh=DBI->connect('DBI:mysql:allegskill','root','asdfjk');

$dbh->do("update stats set status=0");

my $lgp=0;

while(my $line=<INPUT>){
	if($line=~/LastGameProcessedLabel">(\d+)</){
		$lgp=$1;
	}

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

my $columns="callsign,rank,sigma,drn_kills,stn_caps";
#my $callsigns="fwiffo,merc";
my $callsigns="fwiffo,weylin,merc,cashto,podkiller,kltplzyxm,chiveicrook,ryjamsan";

my @callsign_array=split(/,/,$callsigns);
my $callsigns_str="";
foreach my $callsign (@callsign_array){
	$callsigns_str=$callsigns_str."callsign=\"$callsign\" or ";
}
$callsigns_str=~s/ or $//;

#my $sth=$dbh->prepare("select $columns from stats where status=1 order by drn_kills desc limit 10");
my $sth=$dbh->prepare("select $columns from stats where status=1 AND ($callsigns_str) order by drn_kills desc");
$sth->execute();

my @cols=split(/,/,$columns);

print header;
print start_html;

print <<END;
<form action="parse.pl" method="post">
<p>columns <input type="text" name="icolumns" value="$columns" size="80"></p><br>
<p>callsigns <input type="text" name="icallsigns" value="$callsigns" size="80"></p><br>
<input type="submit" name="submit" value="Submit">
</form>
END


print "<hr>";
print "Last Game Processed: $lgp<br>";
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
