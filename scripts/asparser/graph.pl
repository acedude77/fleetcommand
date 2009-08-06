#!/usr/bin/perl -w
use Chart::Strip;
use DBI;
use Date::Manip;

my $db="allegskill";
my $user="root";
my $password="asdfjk";

my $dbh  = DBI->connect ("DBI:mysql:database=$db:host=localhost",
        $user,
        $password)
        or die "Can't connect to database: $DBI::errstr\n";
my $sth;

$sth=$dbh->prepare('select timestamp,kills_per_ejects,kills_per_hr,rank,wins,losses,drn_kills,hrs_played from stats where callsign = \'champyx\' AND timestamp > (now() - interval 1 week) order by timestamp');
$sth->execute();

my($data,$data1,$data2,$data3,$data4);

while(my($timestamp,$kills_per_ejects,$kills_per_hr,$rank,$wins,$losses,$drn_kills,$hrs_played)=$sth->fetchrow_array()){
	$unixdate=UnixDate(ParseDate($timestamp),"%s");
	#print "$unixdate $rank\n";
	push @$data, {time => $unixdate, value => $kills_per_ejects};
	push @$data1, {time => $unixdate, value => $kills_per_hr};
	push @$data2, {time => $unixdate, value => $rank};
	#push @$data3, {time => $unixdate, value => $drn_kills/($wins+$losses)};
	push @$data3, {time => $unixdate, value => $drn_kills/$hrs_played};

}


$sth=$dbh->prepare('select timestamp,kills_per_ejects,kills_per_hr,rank,wins,losses,drn_kills,hrs_played from stats where callsign = \'champyx\' AND timestamp > (now() - interval 1 week) order by timestamp');
$sth->execute();

my $once=1;
my $drn_kills_sow=0;
while(my($timestamp,$kills_per_ejects,$kills_per_hr,$rank,$wins,$losses,$drn_kills,$hrs_played)=$sth->fetchrow_array()){
	if($once==1){
		$drn_kills_sow=$drn_kills;
		$once=0;
	}
	$drn_kills=$drn_kills-$drn_kills_sow;
	$unixdate=UnixDate(ParseDate($timestamp),"%s");
	push @$data4, {time => $unixdate, value => $drn_kills};
}


my $img = Chart::Strip->new(title   => 'drone_kills',
			    x_label => '',
			    y_label => '',
			    transparent => 0,
			    );

#$img->add_data( $data, { label => 'kills_per_ejects', style => 'line',   color => '802000' } );
#$img->add_data( $data1, { label => 'kills_per_hr', style => 'line',   color => 'FF0000' } );
#$img->add_data( $data2, { label => 'rank', style => 'line',   color => '00FF00' } );
#$img->add_data( $data3, { label => 'champyx', style => 'line',   color => '0000FF' } );
$img->add_data( $data4, { label => 'champyx', style => 'points',   color => 'FF0000' } );

print $img->png();


