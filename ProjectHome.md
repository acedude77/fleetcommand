The fleet command image generator project is now defunct. Instead, this project space is a repository for other Allegiance related projects.

# Current project: End Game XML Score Parser/Reporter #

to obtain the latest version of the current project:
```
svn checkout https://fleetcommand.googlecode.com/svn/trunk/scripts/allegxml fleetcommand-read-only
```






---

this is deprecated info related to the old image generator project

The idea is that once we have a game map structured we can take that map and turn it into a code that can be updated (as bases get built and fleets move around, etc.) without having to manually go in and draw them in. So, as teams give us their movements each round its a matter of entering their movements into the database and the map is drawn automatically. This eliminates the need for to have to wait for a graphics person to draw the map each round.

export SVNREP=https://fleetcommand.googlecode.com/svn

git-svn clone $SVNREP -T trunk -b branches -t tags --username borgified

git-svn dcommit