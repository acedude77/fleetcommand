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

<img style="position:absolute;left:210px;" src="../AW5Map1024.png" usemap="#map1" border="0" height="793" width="1024">
<img style="position:absolute;left:210px;" src="../map1024tbak2.gif" usemap="#map1" border="0" height="793" width="1024">

<img class="octagon" name="holder" id="holder" src="../blancOctagon.gif" alt="Holder" onmouseover="setActiveStyleSheet('bigger');return false;" onmouseout="setActiveStyleSheet('smaller');return false;">

<div class="controls" onmouseover="setActiveStyleSheet('bigcontrol');return false;" onmouseout="setActiveStyleSheet('smaller');return false;">

<div class="controltable">
Visibility<br>
<input type="checkbox" name="visibility">Rebels</input>
<input type="checkbox" name="visibility">Scions</input>
</div>
<div class="xtracontroltable">
<input style="float:right; padding:0 0 2 2;" type="submit" name="submit"></input>
</div>
<div style="clear:both;"></div>
<div class="controltable">

<input type="radio" name="sector7">Garrison</input><br>
<input type="radio" name="sector7">Outpost</input><br>
<input type="radio" name="sector7">War Factory</input><br>
<input type="radio" name="sector7">Intelligence Agency</input><br>
<input type="radio" name="sector7">Research Facility</input><br>
<input type="radio" name="sector7">Shipyard</input><br>
<input type="radio" name="sector7">Supremacy</input><br>
<input type="radio" name="sector7">Tactical</input><br>

</div>
<div class="xtracontroltable">
<input type="checkbox" name="7.light">Light</input><br>
<input type="checkbox" name="7.yellow">Yellow</input><br> 
<input type="checkbox" name="7.blue">Blue</input><br> 
<input type="checkbox" name="7.one">+1</input><br> 
<input type="checkbox" name="7.two">+2</input><br> 
<input type="checkbox" name="7.upgonce">Upgrade Once</input><br> 
<input type="checkbox" name="7.upgtwice">Upgrade Twice</input><br> 
<input type="checkbox" name="7.cons">Constructor</input><br> 
</div>

<div style="clear:both;"></div>
<div class="controltable">
<input type="checkbox" name="sector8">Refinery</input>
</div>

<div class="xtracontroltable">
<input type="checkbox" name="8.light">L</input> 
<input type="checkbox" name="8.yellow">Y</input> 
<input type="checkbox" name="8.blue">B</input> 
<input type="checkbox" name="8.one">+1</input> 
<input type="checkbox" name="8.two">+2</input> 
<input type="checkbox" name="8.upgonce">U</input> 
<input type="checkbox" name="8.upgtwice">UU</input> 
<input type="checkbox" name="8.cons">C</input> 

</div>

<div style="clear:both;"></div>
<div class="controltable">
<input type="checkbox" name="sector1">Teleport</input>
</div>
<div class="xtracontroltable">
<input type="checkbox" name="1.light">L</input> 
<input type="checkbox" name="1.yellow">Y</input> 
<input type="checkbox" name="1.blue">B</input> 
<input type="checkbox" name="1.one">+1</input> 
<input type="checkbox" name="1.two">+2</input> 
<input type="checkbox" name="1.upgonce">U</input> 
<input type="checkbox" name="1.upgtwice">UU</input> 
<input type="checkbox" name="1.cons">C</input> 
</div>

<div style="clear:both;"></div>
<div class="controltable">
<input type="radio" name="sector2">Carrier</input><br>
<input type="radio" name="sector2a">Assault Carrier</input>
</div>

<div class="xtracontroltable">
<input type="checkbox" name="2.light">L</input> 
<input type="checkbox" name="2.yellow">Y</input> 
<input type="checkbox" name="2.blue">B</input> 
<input type="checkbox" name="2.one">+1</input> 
<input type="checkbox" name="2.two">+2</input> 
<input type="checkbox" name="2.upgonce">U</input> 
<input type="checkbox" name="2.upgtwice">UU</input> 
<input type="checkbox" name="2.cons">C</input> 
</div>

<div style="clear:both;"></div>
<div class="controltable">
<input type="checkbox" name="sector4">4.Fleet</input>
</div>

<div class="xtracontroltable">
<input type="checkbox" name="4.light">L</input> 
<input type="checkbox" name="4.yellow">Y</input> 
<input type="checkbox" name="4.blue">B</input> 
<input type="checkbox" name="4.one">+1</input> 
<input type="checkbox" name="4.two">+2</input> 
<input type="checkbox" name="4.upgonce">U</input> 
<input type="checkbox" name="4.upgtwice">UU</input> 
<input type="checkbox" name="4.cons">C</input> 
</div>

<div style="clear:both;"></div>
<div class="controltable">
<input type="checkbox" name="sector5">5.Fleet</input>
</div>

<div class="xtracontroltable">
<input type="checkbox" name="5.light">L</input> 
<input type="checkbox" name="5.yellow">Y</input> 
<input type="checkbox" name="5.blue">B</input> 
<input type="checkbox" name="5.one">+1</input> 
<input type="checkbox" name="5.two">+2</input> 
<input type="checkbox" name="5.upgonce">U</input> 
<input type="checkbox" name="5.upgtwice">UU</input> 
<input type="checkbox" name="5.cons">C</input> 
</div>

<div style="clear:both;"></div>
<div class="controltable">
<input type="checkbox" name="sector6">6.Fleet</input>
</div>

<div class="xtracontroltable">
<input type="checkbox" name="6.light">L</input> 
<input type="checkbox" name="6.yellow">Y</input> 
<input type="checkbox" name="6.blue">B</input> 
<input type="checkbox" name="6.one">+1</input> 
<input type="checkbox" name="6.two">+2</input> 
<input type="checkbox" name="6.upgonce">U</input> 
<input type="checkbox" name="6.upgtwice">UU</input> 
<input type="checkbox" name="6.cons">C</input> 
</div>



</div>
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
	print qq/<area shape="rect" coords="$x1,$y1,$x2,$y2" onclick="changer('holder',$item);" onmouseup="changer('holder',$item);">\n/;
}
print $output3;
