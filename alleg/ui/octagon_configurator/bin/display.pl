#!/usr/bin/perl -w
use CGI qw(:standard);
use DBI;

my $user='alleguser';
my $pass='pZbDdzuW.tmXMvqX';
my $dsn='dbi:mysql:alleg:localhost:3306';
my $dbh=DBI->connect($dsn,$user,$pass);

$output1 = <<END1;
<html>
<head>
<SCRIPT LANGUAGE="JavaScript" type="text/javascript">
  <!--
  //JavaScript Disjointed Imagemap Code
  //copyright daxassist, 2000-2004
  //visit http://www.daxassist.com for this and other javascripts with full tutorials.

  if(document.images) {
    pics = new Array();
    pics[0] = new Image();
    pics[0].src = "../blancOctagon.gif";
    pics[1] = new Image();
    pics[1].src = "../Jupiter.png";
END1
#    pics[02] = new Image();
#    pics[02].src = "largeimage02.gif";
#    pics[03] = new Image();
#    pics[03].src = "largeimage03.gif";
#    pics[04] = new Image();
#    pics[04].src = "holderimage.gif";

$output2 = <<END2;
  }
    function changer(from,to) {
    if(document.images) {
    document.images[from].src = pics[to].src;
    }
 } 
//-->
</SCRIPT>
<script type="text/javascript" src="styleswitcher.js"></script>
<link rel="stylesheet" type="text/css" href="smaller.css" title="smaller" />
<link rel="stylesheet" type="text/css" href="style.css" />
<link rel="alternate stylesheet" type="text/css" href="bigger.css" title="bigger" />
<link rel="alternate stylesheet" type="text/css" href="bigcontrol.css" title="bigcontrol" />
</head>


<body>
<form action="display.pl" method="post">
<img style="position:absolute;left:210px;" src="../AW5Map1024.png" border="0" height="793" width="1024">
<img style="position:absolute;left:210px;" src="../map1024tbak2.gif" usemap="#map1" border="0" height="793" width="1024">

<img class="octagon" name="holder" id="holder" src="../blancOctagon.gif" alt="Holder" onmouseover="setActiveStyleSheet('bigger');return false;" onmouseout="setActiveStyleSheet('smaller');return false;">

<div class="controls" onmouseover="setActiveStyleSheet('bigcontrol');return false;" onmouseout="setActiveStyleSheet('smaller');return false;">

<div class="controltable">
Sector ID <input type="text" name="0.sectorid" id="sectorid" value="" size="3"><br>
Visibility<br>
<input type="checkbox" name="0.rebelvisibility">Rebels</input><br>
<input type="checkbox" name="0.scionvisibility">Scions</input><br>
</div>
<div class="xtracontroltable">
<p style="text-align:center"><input style="padding:0 0 2 2;" type="submit" name="0.submit" value="Submit"><br><input type="reset"></p>
</div>
<div style="clear:both;"></div>
<div class="controltable">

<input type="radio" name="7.sector7" value="">None</input><br>
<input type="radio" name="7.sector7" value="sector7Garr.gif sector7BaseIcon.gif">Garrison</input><br>
<input type="radio" name="7.sector7" value="sector7Outpost.gif sector7BaseIcon.gif">Outpost</input><br>
<input type="radio" name="7.sector7" value="sector7Warfactory.gif sector7BaseIcon.gif">War Factory</input><br>
<input type="radio" name="7.sector7" value="sector7Intelligence.gif sector7BaseIcon.gif">Intelligence Agency</input><br>
<input type="radio" name="7.sector7" value="sector7Research.gif sector7BaseIcon.gif">Research Facility</input><br>
<input type="radio" name="7.sector7" value="sector7ShipYard.gif sector7BaseIcon.gif">Shipyard</input><br>
<input type="radio" name="7.sector7" value="sector7Sup.gif sector7BaseIcon.gif">Supremacy</input><br>
<input type="radio" name="7.sector7" value="sector7Tac.gif sector7BaseIcon.gif">Tactical</input><br>

</div>
<div class="xtracontroltable">
<input type="checkbox" name="7.light" value="sector7Light.gif">Light</input><br>
<input type="checkbox" name="7.0yellow" value="sector7BackgroundYellow.gif">Yellow</input><br> 
<input type="checkbox" name="7.0blue" value="sector7BackgroundBlue.gif">Blue</input><br> 
<input type="checkbox" name="7.one" value="sector7One.gif">+1</input><br> 
<input type="checkbox" name="7.two" value="sector7Two.gif">+2</input><br> 
<input type="checkbox" name="7.upgonce" value="sector7UpgradeOnce.gif">Upgrade Once</input><br> 
<input type="checkbox" name="7.upgtwice" value="sector7UpgradeTwice.gif">Upgrade Twice</input><br> 
<input type="checkbox" name="7.cons" value="sector7Constructor.gif">Constructor</input><br> 
</div>

<div style="clear:both;"></div>
<div class="controltable">
<input type="checkbox" name="8.sector8" value="sector8Refinery.gif">Refinery</input>
</div>

<div class="xtracontroltable">
<input type="checkbox" name="8.light" value="sector8Light.gif">L</input> 
<input type="checkbox" name="8.0yellow" value="sector8BackgroundYellow.gif">Y</input> 
<input type="checkbox" name="8.0blue" value="sector8BackgroundBlue.gif">B</input> 
<input type="checkbox" name="8.one" value="sector8One.gif">+1</input> 
<input type="checkbox" name="8.two" value="sector8Two.gif">+2</input> 
<input type="checkbox" name="8.upgonce" value="sector8UpgradeOnce.gif">U</input> 
<input type="checkbox" name="8.upgtwice" value="sector8UpgradeTwice.gif">UU</input> 
<input type="checkbox" name="8.cons" value="sector8Constructor.gif">C</input> 

</div>

<div style="clear:both;"></div>
<div class="controltable">
<input type="checkbox" name="1.sector1" value="sector1Teleport.gif">Teleport</input>
</div>
<div class="xtracontroltable">
<input type="checkbox" name="1.light" value="sector1Light.gif">L</input> 
<input type="checkbox" name="1.0yellow" value="sector1BackgroundYellow.gif">Y</input> 
<input type="checkbox" name="1.0blue" value="sector1BackgroundBlue.gif">B</input> 
<input type="checkbox" name="1.one" value="sector1One.gif">+1</input> 
<input type="checkbox" name="1.two" value="sector1Two.gif">+2</input> 
<input type="checkbox" name="1.upgonce" value="sector1UpgradeOnce.gif">U</input> 
<input type="checkbox" name="1.upgtwice" value="sector1UpgradeTwice.gif">UU</input> 
<input type="checkbox" name="1.cons" value="sector1Constructor.gif">C</input> 
</div>

<div style="clear:both;"></div>
<div class="controltable">
<input type="checkbox" name="2.sector2" value="sector2Carrier.gif">Carrier</input><br>
</div>

<div class="xtracontroltable">
<input type="checkbox" name="2.light" value="sector2Light.gif">L</input> 
<input type="checkbox" name="2.0yellow" value="sector2BackgroundYellow.gif">Y</input> 
<input type="checkbox" name="2.0blue" value="sector2BackgroundBlue.gif">B</input> 
<input type="checkbox" name="2.one" value="sector2One.gif">+1</input> 
<input type="checkbox" name="2.two" value="sector2Two.gif">+2</input> 
<input type="checkbox" name="2.upgonce" value="sector2UpgradeOnce.gif">U</input> 
<input type="checkbox" name="2.upgtwice" value="sector2UpgradeTwice.gif">UU</input> 
<input type="checkbox" name="2.ass" value="sector2AssaultCarrier.gif">A</input>
</div>

<div style="clear:both;"></div>
<div class="controltable">
<input type="checkbox" name="4.sector4" value="sector4Fleet.gif">4.Fleet</input>
</div>

<div class="xtracontroltable">
<input type="checkbox" name="4.0yellow" value="sector4BackgroundYellow.gif">Y</input> 
<input type="checkbox" name="4.0blue" value="sector4BackgroundBlue.gif">B</input> 
<input type="checkbox" name="4.one" value="sector4One.gif">+1</input> 
<input type="checkbox" name="4.two" value="sector4Two.gif">+2</input> 
<input type="checkbox" name="4.upgonce" value="sector4UpgradeOnce.gif">U</input> 
<input type="checkbox" name="4.upgtwice" value="sector4UpgradeTwice.gif">UU</input> 
</div>

<div style="clear:both;"></div>
<div class="controltable">
<input type="checkbox" name="5.sector5" value="sector5Fleet.gif">5.Fleet</input>
</div>

<div class="xtracontroltable">
<input type="checkbox" name="5.0yellow" value="sector5BackgroundYellow.gif">Y</input> 
<input type="checkbox" name="5.0blue" value="sector5BackgroundBlue.gif">B</input> 
<input type="checkbox" name="5.one" value="sector5One.gif">+1</input> 
<input type="checkbox" name="5.two" value="sector5Two.gif">+2</input> 
<input type="checkbox" name="5.upgonce" value="sector5UpgradeOnce.gif">U</input> 
<input type="checkbox" name="5.upgtwice" value="sector5UpgradeTwice.gif">UU</input> 
</div>

<div style="clear:both;"></div>
<div class="controltable">
<input type="checkbox" name="6.sector6" value="sector6Fleet.gif">6.Fleet</input>
</div>

<div class="xtracontroltable">
<input type="checkbox" name="6.0yellow" value="sector6BackgroundYellow.gif">Y</input> 
<input type="checkbox" name="6.0blue" value="sector6BackgroundBlue.gif">B</input> 
<input type="checkbox" name="6.one" value="sector6One.gif">+1</input> 
<input type="checkbox" name="6.two" value="sector6Two.gif">+2</input> 
<input type="checkbox" name="6.upgonce" value="sector6UpgradeOnce.gif">U</input> 
<input type="checkbox" name="6.upgtwice" value="sector6UpgradeTwice.gif">UU</input> 
</div>
</div>
</form>

<map name="map1">

END2

#<area shape="rect" coords="0,0,100,100" onmouseover="changer('holder',1);" onmouseout="changer('holder',0);">

$output3= <<END3;
</map>

</body>
</html>

END3

#===========gather data from db
my $sth=$dbh->prepare('select sector_name,location,map from afcoc');
$sth->execute();
$i=2;

while(($sector_name,$location,$map)=$sth->fetchrow_array()){

	$db{$i}{sector_name}="$sector_name";
	$db{$i}{location}="$location";
	$db{$i}{map}="$map";
	$i++;
}


#foreach $item (sort{$a<=>$b} keys %db){
#	print $db{$item}{sector_name}."\n";
#}

#===========webpage comes next

print header;
print $output1;


foreach $item (sort{$a<=>$b} keys %db){
#    pics[2] = new Image();
#    pics[2].src = "largeimage02.gif";
	print qq/pics[$item] = new Image();\n/;
	print qq/pics[$item].src = \"..\/$db{$item}{sector_name}\.png\";\n/;
}

print $output2;

#<area shape="rect" coords="0,0,100,100" onmouseover="changer('holder',1);" onmouseout="changer('holder',0);">

foreach $item (sort{$a<=>$b} keys %db){
	$coords=$db{$item}{location};
	($x,$y)=split(/,/,$coords);
	$x1=$x-15;
	$y1=$y-15;
	$x2=$x+15;
	$y2=$y+15;
	#print qq/<area shape="rect" coords="$x1,$y1,$x2,$y2" href="$db{$item}{map}" onclick="changer('holder',$item);" onmouseout="changer('holder',$item);">\n/;
	print qq/<area shape="rect" coords="$x1,$y1,$x2,$y2" onclick="changer('holder',$item);document.getElementById('sectorid').value=$item-1;" onmouseup="changer('holder',$item);">\n/;
}

#===========================store form data into db
my @params=param();

#open(OUTPUT,">/tmp/output");

my $sectorid=param("sectorid");
my $backgrounds="";
my $icons="";
my $visibility="";
my $rebelvisibility;
my $scionvisibility;

foreach my $param (sort @params){
	$value=param($param);
	if($param=~/sectorid/){
		$sectorid=$value;
		next;
	}
	if($param=~/submit/){
		next;
	}
	if($param=~/rebelvisibility/){
		$rebelvisibility=$value;
		next;
	}
	if($param=~/scionvisibility/){
		$scionvisibility=$value;
		next;
	}

	if($param=~/0blue|0yellow/){
		$backgrounds=$backgrounds." ".$value;
	}else{
		$icons=$icons." ".$value;
	}
}

#print OUTPUT "$sectorid r:$rebelvisibility s:$scionvisibility\n";
#print OUTPUT "backgrounds: $backgrounds\n";
#print OUTPUT "icons: $icons\n";

if($sectorid=~/\d+/ && $backgrounds ne "" && $icons ne ""){
	$sth=$dbh->prepare("update afcoc set backgrounds='$backgrounds', icons='$icons' where id=$sectorid");
	$sth->execute();
#	print "<div class='controltable' style='clear:both;margin-top:30px;'><a href='generateoct.pl?$sectorid'>generate sector</a><br><a href='generateglobalmap.pl'>generate global map</a></div>";
	print "<div class='controltable' style='clear:both;margin-top:30px;'><a href='showdb.pl'>showdb & generate octagons</a></div>";
}else{
	print "<div class='controltable' style='clear:both;margin-top:30px;'>error: need (at least) sector id, background, icon.</div>";
}

if($rebelvisibility eq "on"){
	$visibility=$visibility." rebels";
}
if($scionvisibility eq "on"){
	$visibility=$visibility." scions";
}
if($visibility ne ""){
	$sth=$dbh->prepare("update afcoc set visibility='$visibility' where id=$sectorid");
	$sth->execute();
}

print $output3;
