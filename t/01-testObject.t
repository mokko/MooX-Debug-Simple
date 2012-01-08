#!perl 
#-T doesn't work with FindBin

use strict;
use warnings;
use Test::More tests => 1;
use FindBin;
#works only under nix-like file system
use lib "$FindBin::Bin/../lib";
use lib '$FindBin::Bin/../t/lib';

BEGIN {
	use_ok('testObject') || print "Bail out!";
}

diag(
"Testing testObject $testObject::VERSION, Perl $], $^X"
);
