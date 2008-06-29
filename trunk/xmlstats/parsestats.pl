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

foreach my $k1 (keys %$teams){
	print "$k1 @{$$teams{$k1}}\n";
}

print "${$$teams{Team}}[1]{Faction}";

print "--------------\n";




__END__

for my $k1 ( sort keys %$scores ) {
      print "$k1\n";
   
      for my $k2 ( sort keys %{$scores->{ $k1 }} ) {
          print "\t$k2\n";
   
          for my $k3 ( sort keys %{$scores->{ $k1 }->{ $k2 }} ) {
              print "\t\t$k3 => $scores->{ $k1 }->{ $k2 }->{ $k3 }\n";
          }
      }
}


