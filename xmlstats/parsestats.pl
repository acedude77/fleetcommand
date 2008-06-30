#!/usr/bin/perl -w

use XML::Simple;
use Data::Dumper;

my $scores = XMLin('scores-2008-6-28_14.25.xml');

#print Dumper($scores);


my $gameinfo=$$scores{GameInfo};
my $playersscore=$$scores{PlayersScore};
my $teams=$$scores{Teams};

foreach my $k1 (keys %$gameinfo) {
	print "$k1 $$gameinfo{$k1}\n";
}

print "--------------\n";

#print "@{$$teams{Team}}\n";
#print "$$teams{Team}\n";

foreach my $k1 (keys %$teams){

	foreach my $k2 (@{$$teams{$k1}}){
		foreach my $k3 (keys(%$k2)){
			print "$k1 $k3 $$k2{$k3}\n";
		}
		print "----\n";
	}	
	#print "$k1 @{$$teams{$k1}}\n";
}

#print "${$$teams{Team}}[1]{Faction}\n";

print "--------------\n";

foreach my $k1 (keys %$playersscore){
	foreach my $k2 (@{$$playersscore{$k1}}){
		foreach my $k3 (keys(%$k2)){
			print "$k3 $$k2{$k3}\n";
		}
		print "----\n";
	}
}

