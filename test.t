#!/usr/bin/env perl

use diagnostics; # this gives you more debugging information
use warnings;    # this warns you of bad practices
use strict;      # this prevents silly errors
use Test::More qw( no_plan ); # for the is() and isnt() functions

#-- check for passed argument
if (@ARGV != 2) {
  die   "usage : perl process.pl MetadataFile DataFile \n";
}

my ($metadata_file, $data_file) = @ARGV;

#-- get extention of file with . to check weather it is .csv or not
my ($ext) = $metadata_file =~ /(\.[^.]+)$/;
my ($data_ext) = $data_file =~ /(\.[^.]+)$/;

is($ext, '.txt', "Metadata file has correct extention");
is($data_ext, '.txt', "Data file has correct extention");


sub simple_validate {
  #-- open file and read it
  open (my $data, '<', $metadata_file) or  die "could not open $metadata_file \n";
  while ( my $string = <$data>) {
    if ( length $string < 1 ) {
      return 0;
    } else {
    return 1;
    }
  close $data;
  }
}

my $file_ok = simple_validate();

is( $file_ok, 1, "no error detection for lengh of each row");
is( $file_ok, 0, "there is something wrong for one or more rows of input file");
