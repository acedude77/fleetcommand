#!/usr/bin/perl -w
# shapes.plx                                                      -*- Perl -*-
#   A simple shapes example 
#
#   Copyright (C) 1998, Bradley M. Kuhn <bkuhn@ebb.org>
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation; either version 2 of
# the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# Please request a copy of the GNU General Public License from the author,
#  or retrieve it from http://www.gnu.org/copyleft/gpl.html
# Alternatively, you can obtain a copy by writing to the Free Software
# Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

use strict;

package Shape;

use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

@ISA    = qw();
@EXPORT = qw();

$VERSION = '0.01';

=head1 NAME

Shape - Perl Shape "base class"

=head1 SYNOPSIS

  use Shape;
  # declaring variables in class Shape is probably counterproductive.  
  #    Use a subclass

=head1 DESCRIPTION

  Shape does not do much.  It is a base class for shapes

=head1 AUTHOR

Bradley M. Kuhn

=head1 SEE ALSO

perl(1).

=cut
###############################################################################
sub draw {
    my($self) = @_;

    croak("Shape::draw() method called from " . ref($self) . " " .
          "but Shape is a virtual base class");

    return $self;
}
###############################################################################
sub moveTo {
    my($self, $newX, $newY) = @_;

    $self->{x} = $newX;
    $self->{y} = $newY;

    return $self;
}
###############################################################################
sub relativeMoveTo {
    my($self, $newX, $newY) = @_;


    $self->{x} += $newX;
    $self->{y} += $newY;

    return $self;
}
###############################################################################
package Rectangle;

use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

@ISA    = qw(Shape);
@EXPORT = qw();

$VERSION = '0.01';

=head1 NAME

Rectangle - Perl Rectangle Shape

=head1 SYNOPSIS

  use Shape;

  my $rect = new Rectangle(0, 0, 5, 4);

  $rect->moveTo(5, 7);
  $rect->draw();

=head1 DESCRIPTION

  Rectangle "draws" a rectangle and allows you to move it


=head1 AUTHOR

Bradley M. Kuhn

=head1 SEE ALSO

perl(1).

=cut
###############################################################################
sub new {
    my($class, $x, $y, $width, $height) = @_;

    my $self = bless {};

    $self->{x} = $x;           $self->{y} = $y;
    $self->{width} = $width;   $self->{height} = $height;

    return $self;
}
###############################################################################
sub draw {
    my($self) = @_;

    print "Drawing a Rectangle at ($self->{x}, $self->{y}) ",
          "with width $self->{width} and height $self->{height}.\n";

    return $self;
}
###############################################################################
sub setWidth {
    my($self, $newWidth) = @_;

    $self->{width} = $newWidth;

    return $self;
}
###############################################################################
sub setHeight {
    my($self, $newHeight) = @_;

    $self->{height} = $newHeight;

    return $self;
}
###############################################################################
package Circle;

use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

@ISA    = qw(Shape);
@EXPORT = qw();

$VERSION = '0.01';

=head1 NAME

Circle - Perl Circle Shape

=head1 SYNOPSIS

  use Shape;

  my $circle = new Circle(0, 0, 5);

  $circle->moveTo(5, 7);
  $circle->draw();

=head1 DESCRIPTION

  Circle "draws" a circle and allows you to move it


=head1 AUTHOR

Bradley M. Kuhn

=head1 SEE ALSO

perl(1).

=cut
###############################################################################
sub new {
    my($class, $x, $y, $radius) = @_;

    my $self = bless {};

    $self->{x} = $x;    $self->{y} = $y;    $self->{radius} = $radius;

    return $self;
}
###############################################################################
sub draw {
    my($self) = @_;

    print "Drawing a Circle at ($self->{x}, $self->{y}) ",
          "with a radius of $self->{radius}.\n";

    return $self;
}
###############################################################################
sub setRadius {
    my($self, $newRadius) = @_;

    $self->{radius} = $newRadius;

    return $self;
}
###############################################################################
###############################################################################
package main;

sub DoSomethingWithShapes {
    my(@shapes) = @_;

    foreach my $shape (@shapes) {
        $shape->draw();
        $shape->relativeMoveTo(100, 100);
        $shape->draw();
    }
}
###############################################################################
my(@shapes);

my $rect1 = new Rectangle(10, 20, 5, 6);
my $circle = new Circle (15, 25, 8);

push(@shapes, $rect1, $circle);

&DoSomethingWithShapes(@shapes);

# access a rectangle specific function

my $rect2 = new Rectangle (0, 0, 15, 15);

$rect2->setWidth(30);
$rect2->draw();

push(@shapes, $rect2);

print "\n\nAdditional stuff with Perl\n\n";

# Now, try something that only circles can do, use eval {} to
#  give it a try so we don't crash on those shapes that don't support
#   the method

foreach my $shape (@shapes) {
    eval {
        # Set the radius, if this happens to support that method
        $shape->setRadius(25);
    };
    $shape->draw();
}

