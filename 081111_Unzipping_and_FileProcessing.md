At this point the xml processing portion is pretty much complete (parsestats.pl). It will grab all the .xml in the same directory the script is in and processes each one in succession. The real challenge is unzipping the variety of different compressions algorithms there are out there. Some superficial categorization can be made by looking at the file extensions but reading the file header and recognizing its file type is probably a better idea. Maybe I can use the linux "file" command for that.

Once the xml files are extracted, there's no guarantee that the user doesn't have some crazy multiple directory scheme to hide their files, so I'll need some way to recursively grab all the xmls, just in case. The current system I'm using (perl globbing) might do this already but I'll have to test it out first.