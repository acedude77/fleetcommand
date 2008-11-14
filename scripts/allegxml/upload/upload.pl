#!/usr/bin/perl -wT

#code  http://www.sitepoint.com/article/uploading-files-cgi-perl

use strict;
use CGI;
use CGI::Carp qw ( fatalsToBrowser );
use File::Basename;
use DBI;
use Email::Valid;
use File::Type;

$CGI::POST_MAX = 1024 * 5000;
my $safe_filename_characters = "a-zA-Z0-9_.-";
my $upload_dir = "/tmp/upload";

my $query = new CGI;

unless (Email::Valid->address($query->param('email_address'))) { 
	print $query->header; 
	print "You supplied an invalid email address.";
	exit; 
} 


my $filename = $query->param("photo");
my $email_address = $query->param("email_address");

if ( !$filename )
{
 print $query->header ( );
 print "There was a problem uploading your file (try a smaller file). LIMIT=5MB";
 exit;
}

my ( $name, $path, $extension ) = fileparse ( $filename, '\..*' );
$filename = $name . $extension;
$filename =~ tr/ /_/;
$filename =~ s/[^$safe_filename_characters]//g;

if ( $filename =~ /^([$safe_filename_characters]+)$/ )
{
 $filename = $1;
}
else
{
 die "Filename contains invalid characters";
}

my $upload_filehandle = $query->upload("photo");

open ( UPLOADFILE, ">$upload_dir/$filename" ) or die "$!";
binmode UPLOADFILE;

while ( <$upload_filehandle> )
{
 print UPLOADFILE;
}

close UPLOADFILE;


my $ft = File::Type->new();

unless ($ft->checktype_filename("$upload_dir/$filename") eq 'application/zip') { 
	print $query->header; 
	print "You must compress your XML files to .zip format prior to uploading.";
	exit; 
}


print $query->header ( );
print <<END_HTML;
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
 <head>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <title>Thanks!</title>
   <style type="text/css">
     img {border: none;}
   </style>
 </head>
 <body>
   <p>Thanks for uploading.</p>
   <p>Your email address: $email_address</p>
   <p>When your report is complete, you will be notified by email.</p>
   <p>May take up to 15 minutes.</p>
 </body>
</html>
END_HTML



my $db="allegstats";
my $host="localhost";
my $user="root";
my $password="";

my $dbh = DBI->connect ("DBI:mysql:database=$db:host=$host",$user,$password) or die "Can't connect to data
base: $DBI::errstr\n";
my $query="insert into uploadinfo values (NULL,\'$filename\',\'$email_address\',NULL)";
my $sth=$dbh->prepare($query);
$sth->execute();

