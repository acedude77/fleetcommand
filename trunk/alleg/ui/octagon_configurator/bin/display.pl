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
<link rel="alternate stylesheet" type="text/css" href="legenda.css" title="legenda" />
</head>
END2

#<area shape="rect" coords="0,0,100,100" onmouseover="changer('holder',1);" onmouseout="changer('holder',0);">


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

print "<map name='map1'>";

foreach $item (sort{$a<=>$b} keys %db){
	$coords=$db{$item}{location};
	($x,$y)=split(/,/,$coords);
	$x1=$x-15;
	$y1=$y-15;
	$x2=$x+15;
	$y2=$y+15;
	print qq/<area shape="rect" coords="$x1,$y1,$x2,$y2" onclick="changer('holder',$item);document.getElementById('sectorid').value=$item-1;" onmouseup="changer('holder',$item);">\n/;
}
print "</map>";
#===========================store form data into db
my @params=param();

#open(OUTPUT,">/tmp/output");

my $sectorid=param("sectorid");
my $backgrounds=" ";
my $visibility=" ";
my $icons="";
my $eyed="";
my $yvis="";
my $bvis="";

foreach my $param (sort @params){
	$value=param($param);
	if($param=~/sectorid/){
		$sectorid=$value;
		next;
	}
	if($param=~/eyed/){
		$eyed=$value;
		next;
	}
	if($param=~/submit/){
		next;
	}
	if($param=~/0blue|0yellow|0grey/){
		$backgrounds=$backgrounds." ".$value;
		next;
	}
	if($param=~/bvis/ && $value=~/bluevis/){
		$visibility=$visibility."blue ";
		next;
	}
	if($param=~/yvis/ && $value=~/yellowvis/){
		$visibility=$visibility."yellow ";
		next;	
	}else{
		$icons=$icons." ".$value;
	}
}

if($eyed eq ""){
	$eyed="no";
}

print "<body>";
if($sectorid=~/\d+/ && $backgrounds ne "" && $icons ne "" && $eyed ne ""){
	$sth=$dbh->prepare("update afcoc set backgrounds='$backgrounds', icons='$icons', eyed='$eyed',visibility='$visibility' where id=$sectorid");
	$sth->execute();
	print "<div class='controltable' style='position:absolute;clear:both;margin-top:230px;'><a href='showdb.pl'>showdb & generate octagons</a><br><a href='colorglobalmap.pl'>update global overlay</a></div>";
}elsif($sectorid=~/\d+/){
	$sth=$dbh->prepare("select eyed,backgrounds,icons,visibility from afcoc where id='$sectorid'");
	$sth->execute();
	my($eyed,$backgrounds,$icons,$visibility)=$sth->fetchrow_array();
	$checked_eyed=" ";
	$checked_bvis=" ";
	$checked_yvis=" ";
	foreach my $i (1..8){
		$checked{$i}{"garr"}		=" ";
		$checked{$i}{"outpost"}		=" ";
		$checked{$i}{"warfactory"}	=" ";
		$checked{$i}{"intelligence"}	=" ";
		$checked{$i}{"shipyard"}	=" ";
		$checked{$i}{"supremacy"}	=" ";
		$checked{$i}{"tactical"}	=" ";
		$checked{$i}{"refinery"}	=" ";
		$checked{$i}{"teleport"}	=" ";
		$checked{$i}{"carrier"}		=" ";
		$checked{$i}{"fleet"}		=" ";
		$checked{$i}{"light"}		=" ";
		$checked{$i}{"yellow"}		=" ";
		$checked{$i}{"blue"}		=" ";
		$checked{$i}{"grey"}		=" ";
		$checked{$i}{"one"}		=" ";
		$checked{$i}{"two"}		=" ";
		$checked{$i}{"upgradeonce"}	=" ";
		$checked{$i}{"upgradetwice"}	=" ";
		$checked{$i}{"constructor"}	=" ";
		$checked{$i}{"assaultcarrier"}	=" ";
	}

	my @backgrounds_list=split(/\s+/,$backgrounds);
	foreach my $bg (@backgrounds_list){
		$bg=~s/\s+//;
		$bg=~/(\d)Background(\w+)/;
		my $mysector=$1;
		my $mycolor=$2;
		$mycolor=~tr/[A-Z]/[a-z]/;

		$checked{$mysector}{$mycolor}="checked";
	}

	my @icons_list=split(/\s+/,$icons);
	foreach my $ikon (@icons_list){
		$ikon=~s/\s+//;
		$ikon=~/sector(\d)(\w+)/;
		my $mysector=$1;
		my $myicon=$2;
		$myicon=~tr/[A-Z]/[a-z]/;

		$checked{$mysector}{$myicon}="checked";
	}

	if($eyed=~/yes/){
		$checked_eyed="checked";
	}
	if($visibility=~/blue/){
		$checked_bvis="checked";
	}
	if($visibility=~/yellow/){
		$checked_yvis="checked";
	}
}else{
	print "<div class='controltable' style='position:absolute;clear:both;margin-top:230px;'>error: need (at least) sector id</div>";
}

$form= <<EOFORM;
<form action="display.pl" method="post">
<img style="position:absolute;left:210px;" src="../AW5Map1024.png" border="0" height="793" width="1024">
<img style="position:absolute;left:210px;" src="../overlay.png" usemap="#map1" border="0" height="793" width="1024">

<img class="legenda" src="../LegendaProposal1.gif" border="0" height="80" width="260" onmouseover="setActiveStyleSheet('legenda');return false;" onmouseout="setActiveStyleSheet('smaller');return false;">

<img class="octagon" name="holder" id="holder" src="../blancOctagon.gif" alt="Holder" onmouseover="setActiveStyleSheet('bigger');return false;" onmouseout="setActiveStyleSheet('smaller');return false;">

<div class="controls" onmouseover="setActiveStyleSheet('bigcontrol');return false;" onmouseout="setActiveStyleSheet('smaller');return false;">

<div class="controltable">
Sector ID <input type="text" name="0.sectorid" id="sectorid" value="" size="3"><br>
<input type="checkbox" name="0.eyed" value="yes" $checked_eyed>Eyed</input><br>
Visible to:<input type="checkbox" name="0.bvis" value="bluevis" $checked_bvis>Blue</input><input type="checkbox" name="0.yvis" value="yellowvis" $checked_yvis>Yellow</input><br>
</div>
<div class="xtracontroltable">
<p style="text-align:center"><input style="padding:0 0 2 2;" type="submit" name="0.submit" value="Submit"><br><input type="reset" value="Reset"></p>
</div>
<div style="clear:both;"></div>
<div class="controltable">

<input type="checkbox" name="7.sector7" value="sector7Garr.gif sector7BaseIcon.gif" $checked{7}{"garr"}>Garrison</input><br>
<input type="checkbox" name="7.sector7" value="sector7Outpost.gif sector7BaseIcon.gif" $checked{7}{"outpost"}>Outpost</input><br>
<input type="checkbox" name="7.sector7" value="sector7Warfactory.gif sector7BaseIcon.gif" $checked{7}{"warfactory"}>War Factory</input><br>
<input type="checkbox" name="7.sector7" value="sector7Intelligence.gif" $checked{7}{"intelligence"}>Intelligence Agency</input><br>
<input type="checkbox" name="7.sector7" value="sector7Research.gif" $checked{7}{"research"}>Research Facility</input><br>
<input type="checkbox" name="7.sector7" value="sector7ShipYard.gif sector7BaseIcon.gif" $checked{7}{"shipyard"}>Shipyard</input><br>
<input type="checkbox" name="7.sector7" value="sector7Sup.gif sector7BaseIcon.gif" $checked{7}{"sup"}>Supremacy</input><br>
<input type="checkbox" name="7.sector7" value="sector7Tac.gif sector7BaseIcon.gif" $checked{7}{"tac"}>Tactical</input><br>

</div>
<div class="xtracontroltable">
<input type="checkbox" name="7.light" value="sector7Light.gif" $checked{7}{"light"}>Light</input><br>
<input type="checkbox" name="7.0yellow" value="sector7BackgroundYellow.gif" $checked{7}{"yellow"}>Yellow</input><br> 
<input type="checkbox" name="7.0blue" value="sector7BackgroundBlue.gif" $checked{7}{"blue"}>Blue</input><br> 
<input type="checkbox" name="7.0grey" value="sector7BackgroundGrey.gif" $checked{7}{"grey"}>Grey</input><br> 
<input type="checkbox" name="7.one" value="sector7One.gif" $checked{7}{"one"}>+1</input><br> 
<input type="checkbox" name="7.two" value="sector7Two.gif" $checked{7}{"two"}>+2</input><br> 
<input type="checkbox" name="7.upgonce" value="sector7UpgradeOnce.gif" $checked{7}{"upgradeonce"}>Upgrade Once</input><br> 
<input type="checkbox" name="7.upgtwice" value="sector7UpgradeTwice.gif" $checked{7}{"upgradetwice"}>Upgrade Twice</input><br> 
<input type="checkbox" name="7.cons" value="sector7Constructor.gif" $checked{7}{"constructor"}>Constructor</input><br> 
</div>

<div style="clear:both;"></div>
<div class="controltable">
<input type="checkbox" name="8.sector8" value="sector8Refinery.gif" $checked{8}{"refinery"}>Refinery</input>
</div>

<div class="xtracontroltable">
<input type="checkbox" name="8.light" value="sector8Light.gif" $checked{8}{"light"}>L</input> 
<input type="checkbox" name="8.0yellow" value="sector8BackgroundYellow.gif" $checked{8}{"yellow"}>Y</input> 
<input type="checkbox" name="8.0blue" value="sector8BackgroundBlue.gif" $checked{8}{"blue"}>B</input> 
<input type="checkbox" name="8.0grey" value="sector8BackgroundGrey.gif" $checked{8}{"grey"}>G</input><br> 
<input type="checkbox" name="8.one" value="sector8One.gif" $checked{8}{"one"}>+1</input> 
<input type="checkbox" name="8.two" value="sector8Two.gif" $checked{8}{"two"}>+2</input> 
<input type="checkbox" name="8.upgonce" value="sector8UpgradeOnce.gif" $checked{8}{"upgradeonce"}>U</input> 
<input type="checkbox" name="8.upgtwice" value="sector8UpgradeTwice.gif" $checked{8}{"upgradetwice"}>UU</input> 
<input type="checkbox" name="8.cons" value="sector8Constructor.gif" $checked{8}{"constructor"}>C</input> 

</div>

<div style="clear:both;"></div>
<div class="controltable">
<input type="checkbox" name="1.sector1" value="sector1Teleport.gif" $checked{1}{"teleport"}>Teleport</input>
</div>
<div class="xtracontroltable">
<input type="checkbox" name="1.light" value="sector1Light.gif" $checked{1}{"light"}>L</input> 
<input type="checkbox" name="1.0yellow" value="sector1BackgroundYellow.gif" $checked{1}{"yellow"}>Y</input> 
<input type="checkbox" name="1.0blue" value="sector1BackgroundBlue.gif" $checked{1}{"blue"}>B</input> 
<input type="checkbox" name="1.0grey" value="sector1BackgroundGrey.gif" $checked{1}{"grey"}>G</input><br> 
<input type="checkbox" name="1.one" value="sector1One.gif" $checked{1}{"one"}>+1</input> 
<input type="checkbox" name="1.two" value="sector1Two.gif" $checked{1}{"two"}>+2</input> 
<input type="checkbox" name="1.upgonce" value="sector1UpgradeOnce.gif" $checked{1}{"upgradeonce"}>U</input> 
<input type="checkbox" name="1.upgtwice" value="sector1UpgradeTwice.gif" $checked{1}{"upgradetwice"}>UU</input> 
<input type="checkbox" name="1.cons" value="sector1Constructor.gif" $checked{1}{"constructor"}>C</input> 
</div>

<div style="clear:both;"></div>
<div class="controltable">
<input type="checkbox" name="2.sector2" value="sector2Carrier.gif" $checked{2}{"carrier"}>Carrier</input><br>
</div>

<div class="xtracontroltable">
<input type="checkbox" name="2.light" value="sector2Light.gif" $checked{2}{"light"}>L</input> 
<input type="checkbox" name="2.0yellow" value="sector2BackgroundYellow.gif" $checked{2}{"yellow"}>Y</input> 
<input type="checkbox" name="2.0blue" value="sector2BackgroundBlue.gif" $checked{2}{"blue"}>B</input> 
<input type="checkbox" name="2.0grey" value="sector2BackgroundGrey.gif" $checked{2}{"grey"}>G</input><br> 
<input type="checkbox" name="2.one" value="sector2One.gif" $checked{2}{"one"}>+1</input> 
<input type="checkbox" name="2.two" value="sector2Two.gif" $checked{2}{"two"}>+2</input> 
<input type="checkbox" name="2.upgonce" value="sector2UpgradeOnce.gif" $checked{2}{"upgradeonce"}>U</input> 
<input type="checkbox" name="2.upgtwice" value="sector2UpgradeTwice.gif" $checked{2}{"upgradetwice"}>UU</input> 
<input type="checkbox" name="2.ass" value="sector2AssaultCarrier.gif" $checked{2}{"assaultcarrier"}>A</input>
</div>

<div style="clear:both;"></div>
<div class="controltable">
<input type="checkbox" name="4.sector4" value="sector4Fleet.gif" $checked{4}{"fleet"}>4.Fleet</input>
</div>

<div class="xtracontroltable">
<input type="checkbox" name="4.0yellow" value="sector4BackgroundYellow.gif" $checked{4}{"yellow"}>Y</input> 
<input type="checkbox" name="4.0blue" value="sector4BackgroundBlue.gif" $checked{4}{"blue"}>B</input> 
<input type="checkbox" name="4.0grey" value="sector4BackgroundGrey.gif" $checked{4}{"grey"}>G</input><br> 
<input type="checkbox" name="4.one" value="sector4One.gif" $checked{4}{"one"}>+1</input> 
<input type="checkbox" name="4.two" value="sector4Two.gif" $checked{4}{"two"}>+2</input> 
<input type="checkbox" name="4.upgonce" value="sector4UpgradeOnce.gif" $checked{4}{"upgradeonce"}>U</input> 
<input type="checkbox" name="4.upgtwice" value="sector4UpgradeTwice.gif" $checked{4}{"upgradetwice"}>UU</input> 
</div>

<div style="clear:both;"></div>
<div class="controltable">
<input type="checkbox" name="5.sector5" value="sector5Fleet.gif" $checked{5}{"fleet"}>5.Fleet</input>
</div>

<div class="xtracontroltable">
<input type="checkbox" name="5.0yellow" value="sector5BackgroundYellow.gif" $checked{5}{"yellow"}>Y</input> 
<input type="checkbox" name="5.0blue" value="sector5BackgroundBlue.gif" $checked{5}{"blue"}>B</input> 
<input type="checkbox" name="5.0grey" value="sector5BackgroundGrey.gif" $checked{5}{"grey"}>G</input><br> 
<input type="checkbox" name="5.one" value="sector5One.gif" $checked{5}{"one"}>+1</input> 
<input type="checkbox" name="5.two" value="sector5Two.gif" $checked{5}{"two"}>+2</input> 
<input type="checkbox" name="5.upgonce" value="sector5UpgradeOnce.gif" $checked{5}{"upgradeonce"}>U</input> 
<input type="checkbox" name="5.upgtwice" value="sector5UpgradeTwice.gif" $checked{5}{"upgradetwice"}>UU</input> 
</div>

<div style="clear:both;"></div>
<div class="controltable">
<input type="checkbox" name="6.sector6" value="sector6Fleet.gif" $checked{6}{"fleet"}>6.Fleet</input>
</div>

<div class="xtracontroltable">
<input type="checkbox" name="6.0yellow" value="sector6BackgroundYellow.gif" $checked{6}{"yellow"}>Y</input> 
<input type="checkbox" name="6.0blue" value="sector6BackgroundBlue.gif" $checked{6}{"blue"}>B</input> 
<input type="checkbox" name="6.0grey" value="sector6BackgroundGrey.gif" $checked{6}{"grey"}>G</input><br> 
<input type="checkbox" name="6.one" value="sector6One.gif" $checked{6}{"one"}>+1</input> 
<input type="checkbox" name="6.two" value="sector6Two.gif" $checked{6}{"two"}>+2</input> 
<input type="checkbox" name="6.upgonce" value="sector6UpgradeOnce.gif" $checked{6}{"upgradeonce"}>U</input> 
<input type="checkbox" name="6.upgtwice" value="sector6UpgradeTwice.gif" $checked{6}{"upgradetwice"}>UU</input> 
</div>
</div>
</form>
EOFORM


print $form;
print "</body>";
print end_html;
