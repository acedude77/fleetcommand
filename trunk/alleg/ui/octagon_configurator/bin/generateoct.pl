#!/usr/bin/perl -w
use CGI qw(:standard);
use DBI;

print header,start_html;
print "generating sectorid: @ARGV\n";
print end_html;



