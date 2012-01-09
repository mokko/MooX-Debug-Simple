package MooX::Debug::Simple;
use strict;
use warnings;
use Moo::Role;
use Carp 'carp';

# ABSTRACT: a simple debug method to print to STDERR

=head2 SYNOPSIS

package Object;
	use Moo;
	with('MooX::Debug::Simple'); #inherit method debug

	sub do {
		my $self=shift;
		$self->debug ("msg");
	}
1;

#elsewhere
	my $obj=new Object (debugging=>1); 
	$obj->do; #prints

	$obj=new Object (debugging=>0);
	$obj->do; #does not print

#using setter/getter
	$obj->debugging(1); #turn debugging messages on 
	$obj->debugging(0); #turn debugging messages off 
	
=cut

has debugging => (
	is  => 'rw',
	isa => sub {
		die "debugging must be 0 or 1 ($_[0])" unless ( $_[0] == 1 or $_[0] == 0 )
	},
);

sub debug {
	my $self = shift or return;
	my $msg  = shift or return;
	carp "$msg\n" if ( $self->debugging && $self->debugging > 0 );
}

1;
