
use strict;
use warnings;
use Test::More tests => 1;
use FindBin;
#works only under nix-like file system
use lib "$FindBin::Bin/../lib";
use lib '$FindBin::Bin/../t/lib';

use testObject;

my $obj=new testObject (debugging=>1);
$obj->do;

ok(1,'dummy');
