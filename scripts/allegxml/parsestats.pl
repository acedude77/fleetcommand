#!/usr/bin/perl -w

use XML::Simple;
use DBI;
use Digest::MD5 qw(md5_hex);
#use Data::Dumper;

my $db="allegstats";
my $host="localhost";
my $user="root";
my $password="";

my $dbh = DBI->connect ("DBI:mysql:database=$db:host=$host",$user,$password) or die "Can't connect to database: $DBI::errstr\n";

&main;

sub main {
	my @xmlfiles=<*.xml>;
	foreach my $xml (@xmlfiles){

		my $input = `grep -v "<Date>" $xml`;
		my $cksum = md5_hex($input);

		if(alreadySeen($cksum)){
			print "Already seen, skipping $xml.\n";
		}else{
			processFile($xml,$cksum);
			print "Processed $xml.\n";
		}
	}
}

sub alreadySeen() {
	my ($cksum)=@_;

	my $query="select * from fileinfo where checksum=\'$cksum\'";
	my $sth=$dbh->prepare($query);
	$sth->execute();

	my $result=$sth->fetchrow();
	if(defined($result)){
       		return 1;
	}else{
		return 0;
	}
}


sub processFile(){
	my($file,$cksum)=@_;

	my $scores = XMLin($file);


	my $query="insert into fileinfo values (NULL,\'$file\',\'$cksum\')";
	my $sth=$dbh->prepare($query);
	$sth->execute();


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

$query="insert into gameinfo ("."@col".",checksum) values (".$str.",\'$cksum\');";
$sth=$dbh->prepare($query);
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
			if($$k2{$k3}=~/HASH\(/){ #when team name is blank
				push(@col,$k3);	
				push(@val,"");
			}else{
				push(@col,$k3);	
				push(@val,$$k2{$k3});
			}
		}
		$str="";
		foreach my $item (@val){
			$item=~s/'/_/g;
        		$str=$str."\'$item\',";
		}
		chop($str);

		$" = ",";

		my $query="insert into teaminfo ("."@col".",checksum) values (".$str.",\'$cksum\');";
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

                my $query="insert into playerinfo ("."@col".",checksum) values (".$str.",\'$cksum\');";
                my $sth=$dbh->prepare($query);
                $sth->execute();
                undef(@col);undef(@val);

		#print "----\n";
	}
}
}
