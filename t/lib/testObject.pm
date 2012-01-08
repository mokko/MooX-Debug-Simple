package testObject;

our $VERSION='0.01';

use Moo;
with('MooX::Debug::Simple');

sub do {
	my $self=shift;
	$self->debug ("msg");
}

1;