#!/usr/bin/perl -w

use CGI qw(:standard);

use DBI;

my $user='root';
my $pass='';
my $dsn='dbi:mysql:alleg:localhost:3306';
my $dbh=DBI->connect($dsn,$user,$pass);

my $sth=$dbh->prepare('select sector_name,location from afcoc');
$sth->execute();

while(@row=$sth->fetchrow_array()){
	$loc{"$row[1]"}=$row[0];	
}

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
</head>

<body>
<form name="pointform" method="post" action="config.pl">
<div id="pointer_div" onClick="point_it(event)" style = "background-image:url('./aw5mapdone1024bc1.png');background-repeat:no-repeat;height:783px;width:1024px;float:left;clear:both;">
<img src="./square.gif" id="square" style="position:relative;visibility:hidden;z-index:2;filter:alpha(opacity=40);opacity:0.4;">
</div>



x = <input type="text" name="form_x" size="4" />
<br>
y = <input type="text" name="form_y" size="4" />
<br>
location: <input type="text" name="location">
<br>
<select name="sector">
	<option value='sector1'>Sector 1</option>
	<option value='sector2'>Sector 2</option>
	<option value='sector3'>Sector 3</option>
	<option value='sector4'>Sector 4</option>
	<option value='sector5'>Sector 5</option>
	<option value='sector6'>Sector 6</option>
	<option value='sector7'>Sector 7</option>
	<option value='sector8'>Sector 8</option>
</select>
<br>
<input type="radio" name="color" value="blue"> Blue
<br>
<input type="radio" name="color" value="yellow"> Yellow
<br>
<input type="radio" name="color" value="grey"> Grey
<br>


<input type="checkbox" name="baseicon" value="1"> Base Icon
<br>
<input type="checkbox" name="constructor" value="1">Constructor
<br>
<input type="checkbox" name="one" value="1">One
<br>
<input type="checkbox" name="two" value="1">Two
<br>
<input type="checkbox" name="outpost" value="1">Outpost
<br>
<input type="checkbox" name="shipyard" value="1">Shipyard
<br>
<input type="checkbox" name="sup" value="1">Sup
<br>
<input type="checkbox" name="tac" value="1">Tac
<br>
<input type="checkbox" name="garr" value="1">Garr
<br>
<input type="checkbox" name="Upg I" value="1">Upgrade I
<br>
<input type="checkbox" name="Upg II" value="1">Upgrade II
<br>

<input type="submit">
</form>
END

print $indexhtml;

$x=param('form_x');
$y=param('form_y');
$sector=param('sector');
$color=param('color');
$baseicon=param('baseicon');
$constructor=param('constructor');
$one=param('one');
$two=param('two');
$outpost=param('outpost');
$shipyard=param('shipyard');
$sup=param('sup');
$tac=param('tac');
$garr=param('garr');
$upg1=param('upg1');
$upg2=param('upg2');

#$x1=$x-15;
#$y1=$y-15;
#$x2=$x+16;
#$y2=$y+14;


foreach $xy (keys(%loc)){
	($loc_x,$loc_y)=split(/,/,$xy);
	$delta_x=abs($loc_x - $x);
	$delta_y=abs($loc_y - $y);
	if(($delta_x < 15) && ($delta_y < 15)){
		$sector_name=$loc{"$loc_x,$loc_y"};
	}
}

print "<div>$x $y $sector_name</div>";

open(OUTPUT,">>output.txt");

#print OUTPUT qq^<area shape=rect coords=\"$x1,$y1,$x2,$y2\" href="javascript:alert('$sector')">\n^;
print OUTPUT qq^<area shape=rect coords=\"$x,$y\" href="javascript:alert('$sector')">\n^;
#print qq^<meta http-equiv="REFRESH" content="0;url=../index.html">^; 
print end_html;

