#!/usr/bin/perl -w

use CGI qw(:standard);

print header;
print start_html;

print <<END;
<form action="stats.pl" method="post">
<p>columns <input type="text" name="icolumns" value="$columns" size="80"></p><br>
<p>callsigns <input type="text" name="icallsigns" value="$callsigns" size="80"></p><br>
<input type="submit" name="submit" value="Submit">
</form>
END


print "</html>";
