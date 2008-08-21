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
<a class="button" href="#"><span>Rebels</span></a> 
<a class="button" href="#"><span>Scions</span></a> 
<a class="button" href="#"><span>Both</span></a>
</div>
<div style="clear:both;"></div>
<div class="controltable">
<a class="button" href="#"><span>Garrison</span></a> 
<a class="button" href="#"><span>Outpost</span></a> 
<a class="button" href="#"><span>War Factory</span></a> 
<a class="button" href="#"><span>Intelligence Agency</span></a> 
<a class="button" href="#"><span>Research Facility</span></a> 
<a class="button" href="#"><span>Shipyard</span></a> 
<a class="button" href="#"><span>Supremacy</span></a> 
<a class="button" href="#"><span>Tactical</span></a> 

</div>
<div class="xtracontroltable">
<a class="button" href="#"><span>Light</span></a> 
<a class="button" href="#"><span>Heavy</span></a> 
<a class="button" href="#"><span>Yellow</span></a> 
<a class="button" href="#"><span>Blue</span></a> 
<a class="button" href="#"><span>Grey</span></a> 
<a class="button" href="#"><span>+1</span></a> 
<a class="button" href="#"><span>+2</span></a> 
<a class="button" href="#"><span>Upgrade Once</span></a> 
<a class="button" href="#"><span>Upgrade Twice</span></a> 
<a class="button" href="#"><span>Constructor</span></a> 
</div>

<div style="clear:both;"></div>
<div class="controltable">
<a class="button" href="#"><span>Refinery</span></a>
</div>
<div class="xtracontroltable">
<a class="button" href="#"><span>Yellow</span></a> 
<a class="button" href="#"><span>Blue</span></a> 
<a class="button" href="#"><span>Grey</span></a> 
<a class="button" href="#"><span>+1</span></a> 
<a class="button" href="#"><span>+2</span></a> 
<a class="button" href="#"><span>Upgrade Once</span></a> 
<a class="button" href="#"><span>Upgrade Twice</span></a> 
<a class="button" href="#"><span>Constructor</span></a> 
</div>

<div style="clear:both;"></div>
<div class="controltable">
<a class="button" href="#"><span>Teleport</span></a>
</div>
<div class="xtracontroltable">
<a class="button" href="#"><span>Light</span></a> 
<a class="button" href="#"><span>Yellow</span></a> 
<a class="button" href="#"><span>Blue</span></a> 
<a class="button" href="#"><span>Grey</span></a> 
<a class="button" href="#"><span>+1</span></a> 
<a class="button" href="#"><span>+2</span></a> 
<a class="button" href="#"><span>Upgrade Once</span></a> 
<a class="button" href="#"><span>Upgrade Twice</span></a> 
<a class="button" href="#"><span>Constructor</span></a> 
</div>


<div style="clear:both;"></div>
<div class="controltable">
<a class="button" href="#"><span>Carrier</span></a>
<a class="button" href="#"><span>Assault Carrier</span></a>
</div>
<div class="xtracontroltable">
<a class="button" href="#"><span>Yellow</span></a> 
<a class="button" href="#"><span>Blue</span></a> 
<a class="button" href="#"><span>Grey</span></a> 
<a class="button" href="#"><span>Light</span></a> 
<a class="button" href="#"><span>Upgrade Once</span></a> 
<a class="button" href="#"><span>Upgrade Twice</span></a> 
<a class="button" href="#"><span>+1</span></a> 
<a class="button" href="#"><span>+2</span></a> 
</div>


<div style="clear:both;"></div>
<div class="controltable">
<a class="button" href="#"><span>4.Fleet</span></a>
</div>
<div class="xtracontroltable">
<a class="button" href="#"><span>Yellow</span></a> 
<a class="button" href="#"><span>Blue</span></a> 
<a class="button" href="#"><span>Grey</span></a> 
<a class="button" href="#"><span>Upgrade Once</span></a> 
<a class="button" href="#"><span>Upgrade Twice</span></a> 
<a class="button" href="#"><span>+1</span></a> 
<a class="button" href="#"><span>+2</span></a> 
</div>


<div style="clear:both;"></div>
<div class="controltable">
<a class="button" href="#"><span>5.Fleet</span></a>
</div>
<div class="xtracontroltable">
<a class="button" href="#"><span>Yellow</span></a> 
<a class="button" href="#"><span>Blue</span></a> 
<a class="button" href="#"><span>Grey</span></a> 
<a class="button" href="#"><span>Upgrade Once</span></a> 
<a class="button" href="#"><span>Upgrade Twice</span></a> 
<a class="button" href="#"><span>+1</span></a> 
<a class="button" href="#"><span>+2</span></a> 
</div>

<div style="clear:both;"></div>
<div class="controltable">
<a class="button" href="#"><span>6.Fleet</span></a>
</div>
<div class="xtracontroltable">
<a class="button" href="#"><span>Yellow</span></a> 
<a class="button" href="#"><span>Blue</span></a> 
<a class="button" href="#"><span>Grey</span></a> 
<a class="button" href="#"><span>Upgrade Once</span></a> 
<a class="button" href="#"><span>Upgrade Twice</span></a> 
<a class="button" href="#"><span>+1</span></a> 
<a class="button" href="#"><span>+2</span></a> 
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
