#!/usr/bin/perl -w

use GD::Simple;

# create a new image
$img = GD::Simple->new(440,230);

$img->bgcolor('darkblue');
$img->clear;

$img->moveTo(110,100);

$img->bgcolor('white');
$img->fgcolor('white');
$img->ellipse(20,20);

$img->moveTo(110,130);
$img->string('Muscae');
$img->moveTo(110,100);

$img->fgcolor('white');
$img->lineTo(200,110);

$img->bgcolor('white');
$img->fgcolor('white');
$img->ellipse(20,20);

$img->moveTo(200,140);
$img->string('Vitalis');
$img->moveTo(200,110);

print $img->png;
