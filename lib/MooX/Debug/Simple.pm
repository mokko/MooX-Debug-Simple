package MooX::Debug::Simple;
{
  $MooX::Debug::Simple::VERSION = '0.01';
}
use strict;
use warnings;
use Moo::Role;
use Carp 'carp';

# ABSTRACT: a simple debug method to print to STDERR


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

__END__
=pod

=head1 NAME

MooX::Debug::Simple - a simple debug method to print to STDERR

=head1 VERSION

version 0.01

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

=head1 AUTHOR

Maurice Mengel <mauricemengel@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Maurice Mengel.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

