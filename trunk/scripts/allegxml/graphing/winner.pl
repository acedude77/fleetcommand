#!/usr/bin/perl -w

use DBI;

#data is stored into this database
my $db="allegstats";
my $user="root";
my $password="";

my $dbh   = DBI->connect ("DBI:mysql:database=$db:host=localhost",
                           $user,
                           $password) 
                           or die "Can't connect to database: $DBI::errstr\n";


#return -1 if draw, else returns winning team's team number
#return -2 if unforseen error

sub winningTeam{
	my $checksum=$_[0];
	my($query,$sth);

	$query="select GameOverReason from gameinfo where checksum=\'$checksum\'";
	$sth=$dbh->prepare($query);
	$sth->execute();
	my $gameoverreason=$sth->fetchrow_array();
	my $winner;

#list all the possible combinations of GameOverReason here
	if($gameoverreason=~/(.*) won by outlasting all other sides./){
		$winner=$1;
	}elsif($gameoverreason=~/The game was declared a draw/){
		return "-1";
	}else{
		return "-2";
	}

#check if TeamNames are unique. if not, we cannot use GameOverReason to determine winner.

	$query="select Name from teaminfo where checksum=\'$checksum\'";
	$sth=$dbh->prepare($query);
	$sth->execute();
	my $numberOfTeams=$sth->rows;

	$query="select distinct Name from teaminfo where checksum=\'$checksum\'";
	$sth=$dbh->prepare($query);
	$sth->execute();
	my $numberOfUniqueTeams=$sth->rows;

	if($numberOfTeams != $numberOfUniqueTeams){
		#some TeamNames are the same, need to see which team has most members in the top10
		#to determine winner
		#print "duplicate team names found, using top10 to determine winner instead...\n";
		return &checkTopTen($checksum);
	}	


#there are no duplicate TeamNames, we can use GameOverReason to determine winner...

	$query="select TeamNumber,Name from teaminfo where checksum=\'$checksum\'";
	$sth=$dbh->prepare($query);
	$sth->execute();
	while(my($teamnumber,$name)=$sth->fetchrow_array()){
		if($winner eq $name){
			return $teamnumber;
		}
	}

#returns TeamNumber of team with most members in the Top 10 list. this is assumed to be the winning team.
	sub checkTopTen{
		my $checksum=$_[0];
		my $query="select TeamNumber from playerinfo where checksum=\'$checksum\' order by convert(score,decimal(10,6)) desc limit 10";
		my $sth=$dbh->prepare($query);
        	$sth->execute();
		my %tally;
        	while(my($teamnumber)=$sth->fetchrow_array()){
			if(defined($tally{$teamnumber})){
				$tally{"$teamnumber"}=$tally{$teamnumber}+1;
			}else{
				$tally{"$teamnumber"}=1;
			}
		}

		my $high=0;
		my $highteamnumber;

		foreach my $teamnumber (keys %tally){
			if($tally{$teamnumber}>$high){
				$high=$tally{$teamnumber};
				$highteamnumber=$teamnumber;
			}
		}
		return $highteamnumber;	
	}
}

print &winningTeam("6727b04a1843d97b6385a9d3e9631a56");
#print &winningTeam("a44fdb7082ca4ac753651d93b1a21b7a");
#print &winningTeam("a2128c5026f397572bb752662aadd97b");
