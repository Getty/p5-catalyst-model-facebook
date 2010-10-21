package Catalyst::Helper::Model::Facebook;
use strict;
use warnings;

=pod

=head1 NAME

Catalyst::Helper::Model::Facebook - Helper for Facebook models

=head1 SYNOPSIS

  script/myapp_create.pl model MyModel Facebook app_id secret

=head1 DESCRIPTION

Helper for the L<Catalyst> Facebook model.

=head1 USAGE

=head1 METHODS

=head2 mk_compclass

Makes the model class.

=head2 mk_comptest

Makes tests.

=cut

sub mk_compclass {
    my ( $self, $helper, $app_id, $secret ) = @_;

	my %args = (
		app_id => $app_id,
		secret => $secret,
	);
	
    $helper->render_file('modelclass', $helper->{file}, \%args);
    return 1;
}

sub mk_comptest {
    my ($self, $helper) = @_;
    $helper->render_file('modeltest', $helper->{test});
}

=pod

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de>

=head1 BUGS 

Please report any bugs or feature requests to #facebook (or Getty directly) at irc.perl.org, or make a pull request
at http://github.com/Getty/p5-catalyst-model-facebook

=head1 COPYRIGHT & LICENSE 

Copyright 2010 Torsten Raudssus, all rights reserved.

This library is free software; you can redistribute it and/or modify it under the same terms as 
Perl itself, either Perl version 5.8.8 or, at your option, any later version of Perl 5 you may 
have available.

=cut

1;

__DATA__

=begin pod_to_ignore

__modelclass__
package [% class %];

use Moose;
extends 'Catalyst::Model::Facebook';

__PACKAGE__->config(
	app_id => '[% app_id %]',
	secret => '[% secret %]',
);

=head1 NAME

[% class %] - Facebook Catalyst model component

=head1 SYNOPSIS

See L<[% app %]>.

=head1 DESCRIPTION

Facebook Catalyst model component.

=head1 AUTHOR

[% author %]

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

no Moose;
__PACKAGE__->meta->make_immutable;

1;
__modeltest__
use strict;
use warnings;
use Test::More tests => 2;

use_ok('Catalyst::Test', '[% app %]');
use_ok('[% class %]');
