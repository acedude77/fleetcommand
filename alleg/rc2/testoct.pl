#!/usr/bin/perl -w
 
use GD;
use GD::Simple;

&main;
sub main{

    #output filename
    my $outputpng="output.png";	

    #background image
    my $background="constellation_background_image.gif";

    #grid sizes
    local $xgridsize=75;
    local $ygridsize=75;

#create a database of available .gif icon components
    local %componentDB=&createComponentDB;
#    print "$componentDB{7}{One}";

#output filehandle
    open(OUTPUTPNG,">$outputpng");

#create an image same size as the background and place background on it
    my $img_background = newFromGif GD::Image($background);
    ($width,$height)=$img_background->getBounds();
    # create a new image
	#third arg=1 for truecolor
    local $img = GD::Simple->new($width,$height,1);
    $img->copy($img_background,0,0,0,0,$width,$height);

#add grid
    &placeGrid($width,$height,$xgridsize,$ygridsize);

#colors
#$black = $img->colorAllocate(0,0,0);
#$red = $img->colorAllocate(255,0,0);
$blue = $img->colorAllocate(0,0,255);
#$green = $img->colorAllocate(0,255,0);
#$yellow = $img->colorAllocate(255,250,205);

#place a test octagon

#octagon config
	my %config1;
    	$config1{7}{Yellow}="";
    	$config1{7}{UpgradeTwice}="";
    	$config1{7}{Sup}="";
    	$config1{7}{BaseIcon}="";
	$config1{3}{EmptyMoneyTechIcons}="";
#	$config1{3}{Grey}="";
   	&placeOctagon(10,10,\%config1);
	&moneysetting(10,10,"exp tac",0,1,2,3);

    	my %config2;
    	$config2{7}{Blue}="";
    	$config2{1}{Yellow}="";
    	$config2{2}{Yellow}="";
    	$config2{4}{Yellow}="";
    	$config2{5}{Yellow}="";
    	$config2{6}{Yellow}="";
    	$config2{7}{Yellow}="";
    	$config2{8}{Yellow}="";
    	$config2{7}{Garr}="";
    	$config2{7}{Constructor}="";
    	$config2{7}{Two}="";
    	$config2{7}{UpgradeOnce}="";
	$config2{3}{EmptyMoneyTechIcons}="";
#	$config2{3}{Grey}="";
    	&placeOctagon(20,10, \%config2);
	&moneysetting(20,10,"tac sup",3,2,1,0);
	
    	print OUTPUTPNG $img->png;

}

sub moneysetting(){
        my ($x,$y,$category,$tr,$t,$r,$s)=@_;

    	my $x1=$x*$xgridsize;
    	my $y1=$y*$ygridsize;
	
	if($category=~/tac/){
		$img->fill(196+$x1,157+$y1,$blue);
	}
	if($category=~/exp/){
        	$img->fill(196+$x1,163+$y1,$blue);
	}
	if($category=~/sup/){
        	$img->fill(196+$x1,169+$y1,$blue);
	}


#tr
	my $k=0;
	while($tr>0){
        	$img->fill(223+$x1,157+($k*6)+$y1,$blue);
        	$tr--;$k++;
	}


#t
	$k=0;
	while($t>0){
        	$img->fill(235+$x1,157+($k*6)+$y1,$blue);
        	$t--;$k++;
	}

#r
	$k=0;
	while($r>0){
        	$img->fill(247+$x1,157+($k*6)+$y1,$blue);
        	$r--;$k++;
	}

#s
	$k=0;
	while($s>0){
        	$img->fill(259+$x1,157+($k*6)+$y1,$blue);
        	$s--;$k++;
	}
}


sub placeOctagon{
    my($x,$y,$config)=@_;
    my $x1=$x*$xgridsize;
    my $y1=$y*$ygridsize;

    $img->copy(newFromGif GD::Image('blancOctagon.gif'),$x1,$y1,0,0,300,300);

    #color triangles first, delete from %config after coloring
    foreach my $sector (keys %$config){
	foreach my $modifier (keys %{$$config{$sector}}){
	    if($modifier =~/Blue|Yellow|Grey/ ){
		$img->copy(newFromGif GD::Image($componentDB{$sector}{$modifier}),$x1,$y1,0,0,300,300);
		delete $$config{$sector}{$modifier};
	    }
	}
    }

    #place remaining icon components
    foreach my $sector (keys %$config){
	foreach my $modifier (keys %{$$config{$sector}}){
	    $img->copy(newFromGif GD::Image($componentDB{$sector}{$modifier}),$x1,$y1,0,0,300,300);
	}
    }
}

sub createComponentDB{
    my @components=<sector*.gif>;
    my %components;

    foreach my $file (@components){
	$file=~/sector(\d)(\w*)/;
	$components{$1}{$2}="$file";
    }
    return %components;
}


sub placeGrid{
    my ($width,$height,$xstep,$ystep)=@_;

#vertical lines
    $numberOfCols=$width/$xstep;

    $x=1;
    while($x<$numberOfCols){
	if(($x%5)==0){
	    $img->fgcolor('white');
	}else{
	    $img->fgcolor('black');
	}
	$img->moveTo($xstep*$x,0);
	$img->lineTo($xstep*$x,$height);
	$x++;
    }


#horizontal lines
    $numberOfRows=$height/$ystep;

    $y=1;
    while($y<$numberOfRows){
        if(($y%5)==0){
	    $img->fgcolor('white');
        }else{
	    $img->fgcolor('black');
        }
	$img->moveTo(0,$ystep*$y);
	$img->lineTo($width,$ystep*$y);
	$y++;
    }

}

