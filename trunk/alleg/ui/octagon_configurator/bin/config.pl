#!/usr/bin/perl -w

use CGI qw(:standard);

use DBI;

my $user='alleguser';
my $pass='pZbDdzuW.tmXMvqX';
my $dsn='dbi:mysql:alleg:localhost:3306';
my $dbh=DBI->connect($dsn,$user,$pass);

my $sth=$dbh->prepare('insert into sprites (location,sprite_type,team) values (?,?,?)');
$sth->execute();

print header;

#====================================
$indexhtml=<<END;
<html>
<head>
<script language="JavaScript">
function point_it(event){
    pos_x = event.offsetX?(event.offsetX):event.pageX-document.getElementById("pointer_div").offsetLeft;
    pos_y = event.offsetY?(event.offsetY):event.pageY-document.getElementById("pointer_div").offsetTop;
    document.getElementById("square").style.left = (pos_x-15) ;
    document.getElementById("square").style.top = (pos_y-15) ;
    document.getElementById("square").style.visibility = "visible" ;
    document.pointform.form_x.value = pos_x;
    document.pointform.form_y.value = pos_y;
}
</script>
<link rel="stylesheet" type="text/css" href="smaller.css" title="smaller" />
<link rel="alternate stylesheet" type="text/css" href="original.css" title="original" />

</head>

<body>
<form name="pointform" method="post" action="config.pl">
<div id="pointer_div" onClick="point_it(event)" style = "background-image:url('./AW5Map1024.png');background-repeat:no-repeat;height:783px;width:1024px;float:left;clear:both;">
<img src="./square.gif" id="square" style="position:relative;visibility:hidden;z-index:2;filter:alpha(opacity=40);opacity:0.4;">
</div>



x = <input type="text" name="form_x" size="4" />
<br>
y = <input type="text" name="form_y" size="4" />
<br>
<input type="radio" name="team" value="blue"> Blue
<input type="radio" name="team" value="yellow"> Yellow
<br>

<input type="submit">
</form>
END

print $indexhtml;

$submit=param('submit');
$x=param('form_x');
$y=param('form_y');
$team=param('team');

if(param() && $x ne "" && $team ne ""){
	my $location=$x.",".$y;
	$sth->execute($location,"mine_field",$team);
	$lastid=$sth->{'mysql_insertid'};

	print "<div>id:$lastid<br>location: $location<br>team: $team</div>";
}

print end_html;

