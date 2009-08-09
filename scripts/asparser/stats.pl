#!/usr/bin/perl -w

use CGI qw(:standard);
require "/home/jctong/svn/scripts/asparser/graph.pl";

$query=new CGI;
unless($action=$query->param('submit')){
	$action='none';
}


print header;
print start_html;

$callsigns=$query->param('callsigns');
$stat=$query->param('stat');

print <<END;
<form action="stats.pl" method="post">
<p>use comma to separate multiple callsigns
<p>callsigns <input type="text" name="callsigns" value="$callsigns" size="80"></p><br>
<p>pick a stat: <select name="stat">
<option value="mu">Mu</option>
<option value="sigma">Sigma</option>
<option value="rank">Rank</option>
<option value="wins">Wins</option>
<option value="losses">Losses</option>
<option value="draws">Draws</option>
<option value="stack_rating">Stack Rating</option>
<option value="cmd_mu">Cmd Mu</option>
<option value="cmd_sigma">Cmd Sigma</option>
<option value="cmd_rank">Cmd Rank</option>
<option value="cmd_wins">Cmd Wins</option>
<option value="cmd_lossses">Cmd Losses</option>
<option value="cmd_draws">Cmd Draws</option>
<option value="kills">Kills</option>
<option value="ejects">Ejects</option>
<option value="drn_kills">Drn Kills</option>
<option value="stn_kills">Stn Kills</option>
<option value="stn_caps">Stn Caps</option>
<option value="kills_per_ejects">Kills per Eject</option>
<option value="hrs_played">Hours Played</option>
<option value="kills_per_hr">Kills per Hour</option>
</select>


<p>select a duration: <select name="duration">
<option value="past_week">Past Week</option>
<option value="past_month">Past Month</option>
<option value="all">Show All</option>
</select>
<p>
<p><input type="submit" name="submit" value="submit">
</form>
END

if($action eq 'submit'){
	$callsigns=$query->param('callsigns');
	$stat=$query->param('stat');
	$duration=$query->param('duration');

	$callsigns=~s/\s+//g;
	my @callsigns_array=split(/,/,$callsigns);
	&graph($stat,$duration,@callsigns_array);
	print '<hr><img src="/asparser/a.png">';
}


print "</body></html>";
