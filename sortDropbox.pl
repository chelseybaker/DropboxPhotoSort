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
