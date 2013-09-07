# Created early June of 2013 by Chelsey Baker 
# Copy or move all photos in a Dropbox/Photos folder into another directory
# Add this script to the directory
# Run it! 
# 
# Photos are moved into directories that correspond to their date. 
# Directories are in the format YYYY-MM-DD

use warnings;
use strict;

use File::Copy qw(move);
my @files = <*>;

# Foreach file in the current directory 
foreach my $file (@files) {
    # Skip script files
    next if $file =~ /\.pl$/;
    
    # Skip directories
    next if -d $file;

    # Create a directory based on the name of the file (Dropbox uses
    # a naming convention of YYYY-MM-DD for files  
    my $dir = substr($file, 0, 10);
    
    # Create directory if it does not exist
    unless (-d $dir ){
        mkdir($dir)
    }
    
    # Skip if a file of that name exists somehow 
    next if -e "$dir/$file";

    # Move the file into the directory 
    move($file, "$dir/$file");
}
