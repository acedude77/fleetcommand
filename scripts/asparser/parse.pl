#!/usr/bin/perl -w

use DBI;
use CGI qw(:standard);

system("wget --quiet http://leaderboard.alleg.net -O /tmp/index.html");

open(INPUT,"/tmp/index.html");
my $string="";
my $dbh=DBI->connect('DBI:mysql:allegskill','root','asdfjk');


my $sth=$dbh->prepare("select lgp from stats where status=1 limit 1");
$sth->execute();
my $last_lgp=$sth->fetchrow_array();

my $lgp=0;
my $message=" ";

while(my $line=<INPUT>){
	if($line=~/LastGameProcessedLabel">(\d+)</){
		$lgp=$1;
		if($last_lgp == $lgp){
			last;
		}else{
			$dbh->do("update stats set status=0");
		}	
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
		$string="insert into stats values (null,".$line.",null,1,$lgp);";
		$dbh->do($string);
	}
}

system("mv /tmp/index.html /tmp/index.html.old");

my $columns="callsign,rank,wins,losses,sigma,drn_kills,stn_caps,hrs_played";
#my $callsigns="fwiffo,merc";
my $callsigns="pkunk,fwiffo,newbie,pedro,mashmellows,weylin,merc,cashto,podkiller,kltplzyxm,chiveicrook,ryjamsan";

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