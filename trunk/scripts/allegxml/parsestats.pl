#!/usr/bin/perl -w

use XML::Simple;
use DBI;
#use Data::Dumper;

my $scores = XMLin('scores-2008-6-28_14.25.xml');

#print Dumper($scores);


my $db="allegstats";
my $host="localhost";
my $user="root";
my $password="";

my $dbh = DBI->connect ("DBI:mysql:database=$db:host=$host",$user,$password) or die "Can't connect to database: $DBI::errstr\n";

my $gameinfo=$$scores{GameInfo};
my $playersscore=$$scores{PlayersScore};
my $teams=$$scores{Teams};

######## GAMEINFO
my @col;
my @val;

foreach my $k1 (keys %$gameinfo) {
#	print "$k1 $$gameinfo{$k1}\n";
	push(@col,$k1);
	push(@val,$$gameinfo{$k1});
}

my $str;
foreach my $item (@val){
	$str=$str."\'$item\',";
}
chop($str);

$" = ","; 

my $query="insert into gameinfo ("."@col".") values (".$str.");";
my $sth=$dbh->prepare($query);
$sth->execute();


######## TEAMINFO

#print "@{$$teams{Team}}\n";
#print "$$teams{Team}\n";

undef @col;
undef @val;

foreach my $k1 (keys %$teams){

	foreach my $k2 (@{$$teams{$k1}}){
		foreach my $k3 (keys(%$k2)){
			#print "$k1 $k3 $$k2{$k3}\n";
			push(@col,$k3);	
			push(@val,$$k2{$k3});
		}
		$str="";
		foreach my $item (@val){
			$item=~s/'/_/g;
        		$str=$str."\'$item\',";
		}
		chop($str);

		$" = ",";

		my $query="insert into teaminfo ("."@col".") values (".$str.");";
		my $sth=$dbh->prepare($query);
		$sth->execute();
		undef(@col);undef(@val);
	}	
	#print "$k1 @{$$teams{$k1}}\n";
}

#print "${$$teams{Team}}[1]{Faction}\n";

#print "--------------\n";

######## PLAYERINFO

undef(@col);
undef(@val);

foreach my $k1 (keys %$playersscore){
	foreach my $k2 (@{$$playersscore{$k1}}){
		foreach my $k3 (keys(%$k2)){
			#print "$k3 $$k2{$k3}\n";
			push(@col,$k3);
                        push(@val,$$k2{$k3});
		}
                $str="";
                foreach my $item (@val){
                        $item=~s/'/_/g;
                        $str=$str."\'$item\',";
                }
                chop($str);

                $" = ",";

                my $query="insert into playerinfo ("."@col".") values (".$str.");";
                my $sth=$dbh->prepare($query);
                $sth->execute();
                undef(@col);undef(@val);

		#print "----\n";
	}
}

