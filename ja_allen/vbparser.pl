#!/usr/bin/perl -w

use File::Basename;

#@ja_objects=`find ~/allen/trunk/ -type f`;
#@ja_objects=<~/allen/trunk/*.cs>;
#%ja_objects;

@cs_files=`find ~/allen/trunk/ -type f |grep -v css | grep -v \.svn`;


print "@cs_files";

__END__

foreach my $item (@ja_objects){
	chomp($item);
	open(INPUT,"$item");
	while(my $line=<INPUT>){
		if($line=~/public class/i){
			print $line;
		}
	}
}
