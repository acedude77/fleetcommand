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
    my $xgridsize=75;
    my $ygridsize=75;


    open(OUTPUTPNG,">$outputpng");
    $img_background = newFromGif GD::Image($background);
    ($width,$height)=$img_background->getBounds();
    # create a new image
    $img = GD::Simple->new($width,$height);
    $img->copy($img_background,0,0,0,0,$width,$height);
    &placeGrid($width,$height,$xgridsize,$ygridsize);

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











#$img1 = newFromGif GD::Image('constellations.gif');
#$img2 = newFromGif GD::Image('octagon_empty_sample.gif');
#$img3 = newFromGif GD::Image('octagon_filled_sector_1.gif');
#$img4 = newFromGif GD::Image('octagon_filled_sector_6.gif');
#
#$img->copy($img1,0,0,0,0,1000,1300);
#$img->copy($img2,0,0,0,0,300,300); 
#$img->copy($img3,0,0,0,0,300,300); 
#$img->copy($img4,0,0,0,0,300,300); 



#$img->copy($img2,500,500,0,0,300,300); 
#$img->copy($img3,500,500,0,0,300,300); 
#$img->copy($img4,500,500,0,0,300,300); 


print OUTPUTPNG $img->png;
