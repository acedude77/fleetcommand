#!/usr/bin/perl -w

use CGI qw(:standard);
use DBI;

my $dsn = "DBI:mysql:database=test;host=localhost;";
my $dbh = DBI->connect($dsn, "root","");


my $sth=$dbh->prepare("select distinct filename from codeparser");
$sth->execute();
while(my $results=$sth->fetchrow()){
	push(@filenames,$results);
}

$sth=$dbh->prepare("select distinct class from codeparser");
$sth->execute();
while(my $results=$sth->fetchrow()){
	push(@classes,$results);
}


$sth=$dbh->prepare("select distinct sort_type from codeparser");
$sth->execute();
while(my $results=$sth->fetchrow()){
	push(@sort_types,$results);
}


print header,start_html;

print "<FORM enctype='multipart/form-data' action='/cgi-bin/codeparser.pl' TYPE='POST'>";

print "<input type='submit' name='submit'><br>";

print "<select name='filename'>";
print "<option>All</option>";
foreach my $item (sort @filenames){
	print "<option>$item</option>";
}
print "</select>";


print "<select name='class'>";
print "<option>All</option>";
foreach my $item (sort @classes){
	print "<option>$item</option>";
}
print "</select>";


print "<select name='sort_type'>";
print "<option>All</option>";
foreach my $item (sort @sort_types){
	print "<option>$item</option>";
}
print "</select>";



my $query=new CGI;
my $filename=$query->param('filename');
my $class=$query->param('class');
my $sort_type=$query->param('sort_type');
print "<br>";
print "filename  |  line_number  |  class  |  sort_type  |  line";
print "<hr>";

my $sql ="";

if(($filename ne 'All') && ($class ne 'All') && ($sort_type ne 'All')){
	$sql="where filename = \'$filename\' and class=\'$class\' and sort_type=\'$sort_type\'";
}elsif(($filename ne 'All') && ($class ne 'All') && ($sort_type eq 'All')){
	$sql="where filename = \'$filename\' and class=\'$class\'";
}elsif(($filename ne 'All') && ($class eq 'All') && ($sort_type ne 'All')){
	$sql="where filename = \'$filename\' sort_type=\'$sort_type\'";
}elsif(($filename eq 'All') && ($class ne 'All') && ($sort_type ne 'All')){
	$sql="where class=\'$class\' and sort_type=\'$sort_type\'";
}elsif(($filename ne 'All') && ($class eq 'All') && ($sort_type eq 'All')){
	$sql="where filename = \'$filename\'";
}elsif(($filename eq 'All') && ($class ne 'All') && ($sort_type eq 'All')){
	$sql="where class = \'$class\'";
}elsif(($filename eq 'All') && ($class eq 'All') && ($sort_type ne 'All')){
	$sql="where sort_type = \'$sort_type\'";
}

#$sth=$dbh->prepare("select filename,line_number,class,sort_type,line from codeparser where class=\'$class\' and sort_type=\'$sort_type\'");

$sql="select filename,line_number,class,sort_type,line from codeparser ".$sql." order by filename,line_number";

if(param('submit')){
	open(OUTPUT,">/var/www/codeparser/output.txt");
	$sth=$dbh->prepare($sql);
	$sth->execute();
	while(my @results=$sth->fetchrow()){
		print OUTPUT "@results\n";
	}
	print "<a href='/codeparser/output.txt'>results</a>";
}
$filename="";$class="";$sort_type="";
print end_form,end_html;
