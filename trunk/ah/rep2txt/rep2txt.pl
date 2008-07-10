#!/usr/bin/perl -w

sub copy_file {
	my ($srcfile, $destfile) = @_;
	my $buffer;

	open INF, $srcfile or die "\nCan't open $srcfile for reading: $!\n";
	open OUTF, ">$destfile" or die "\nCan't open $destfile for writing: $!\n";

	binmode INF;
	binmode OUTF;

	while (read (INF, $buffer, 65536)	# read in (up to) 64k chunks, write
		and print OUTF $buffer	# exit if read or write fails
  		) {};
	die "Problem copying: $!\n" if $!;

	close OUTF or die "Can't close $destfile: $!\n";
	close INF or die "Can't close $srcfile: $!\n";
}
