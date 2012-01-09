
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "a simple debug method to print to STDERR",
  "AUTHOR" => "Maurice Mengel <mauricemengel\@gmail.com>",
  "BUILD_REQUIRES" => {
    "FindBin" => 0,
    "Moo" => 0,
    "Test::More" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "MooX-Debug-Simple",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "MooX::Debug::Simple",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Moo::Role" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.01",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



