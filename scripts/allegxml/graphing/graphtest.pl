#!/usr/bin/perl -w
use Chart::Strip;

my $ch = Chart::Strip->new(
             title   => 'Happiness of our Group',
             # other options ...
);






$ch->add_data( $davey_data, { style => 'line',
                              color => 'FF0000',
                              label => 'Davey' } );

$ch->add_data( $jenna_data, { style => 'line',
                              color => '00FF88',
                              label => 'Jenna' } );

print $ch->png();
