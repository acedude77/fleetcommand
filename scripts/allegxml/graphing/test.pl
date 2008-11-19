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


sub formatdata{

#input: a sql statement that returns a 2-dimensional array like this:
#+------------+-------+
#| unixtime   | Kills |
#+------------+-------+
#| 1214691944 | 5     | 
#| 1214723014 | 1     | 
#| 1214723837 | 5     | 
#+------------+-------+
#3 rows in set (0.00 sec)
	
	my $query=$_[0];
	my $sth=$dbh->prepare($query);
	$sth->execute();
	my @result;
	while(my($unixtime,$kills)=$sth->fetchrow_array()){
		push(@result,{time=>$unixtime,value=>$kills});
	}
	return \@result;
}

  
use Chart::Strip;

my $ch = Chart::Strip->new(
             title   => 'Happiness of our Group',
             # other options ...
         );

my $jc_query="select gameinfo.unixtime,playerinfo.Kills from gameinfo,playerinfo where gameinfo.checksum=playerinfo.checksum AND Name=\'Fwiffo\@BS\' order by gameinfo.unixtime";

$jc_data=&formatdata($query);


$ch->add_data( $jc_data, { style => 'line',
                              color => '000088',
                              label => 'JC' } );

print $ch->png();
