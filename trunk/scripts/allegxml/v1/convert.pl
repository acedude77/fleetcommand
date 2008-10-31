#!/usr/bin/perl -w

use XML::Hash;
use Data::Dumper;

open(INPUT,"sample.xml");
my @xml=<INPUT>;


my $xml_converter = XML::Hash->new();
my $xml_hash = $xml_converter->fromXMLStringtoHash("@xml");


print Dumper($xml_hash);

