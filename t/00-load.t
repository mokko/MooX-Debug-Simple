#!perl 
#-T doesn't work with FindBin

use strict;
use warnings;
use Test::More tests => 1;
use FindBin;
use lib "$FindBin::Bin/../lib";

BEGIN {
	use_ok('MooX::Debug::Simple') || print "Bail out!";
}

diag(
"Testing MooX::Debug::Simple $MooX::Debug::Simple::VERSION, Perl $], $^X"
);
