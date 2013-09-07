use warnings;
use File::Copy qw(move);
my @files = <*>;

foreach my $file (@files) {
    next if $file =~ /\.pl$/;
    next if -d $file;
    my $dir = substr($file, 0, 10);
    unless (-d $dir ){
        mkdir($dir)
    }
    next if -e "$dir/$file";
    move($file, "$dir/$file");
}
