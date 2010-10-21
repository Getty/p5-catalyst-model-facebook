package Catalyst::Helper::Model::Facebook;
use strict;
use warnings;

=pod

=head1 NAME

Catalyst::Helper::Model::Facebook - Helper for Facebook models

=head1 SYNOPSIS

  script/myapp_create.pl model MyModel Facebook app_id secret [facebook_class] [facebook_cookie_class]

=head1 DESCRIPTION

Helper for the L<Catalyst> L<Facebook> model.

=head1 USAGE

=head1 METHODS

=head2 mk_compclass

Makes the model class.

=head2 mk_comptest

Makes tests.

=cut

sub mk_compclass {
    my ( $self, $helper, $app_id, $secret, $facebook_class, $facebook_cookie_class ) = @_;

	my %args = (
		app_id => $app_id,
		secret => $secret,
		facebook_class => $facebook_class,
		facebook_cookie_class => $facebook_cookie_class,
	);
	
    $helper->render_file('modelclass', $helper->{file}, \%args);
    return 1;
}

sub mk_comptest {
    my ($self, $helper) = @_;
    $helper->render_file('modeltest', $helper->{test});
}

=pod

=head1 SUPPORT

IRC

  Join #facebook on irc.perl.org.

Repository

  http://github.com/Getty/p5-catalyt-model-facebook
  Pull request and additional contributors are welcome
 
Issue Tracker

  http://github.com/Getty/p5-catalyt-model-facebook/issues

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de> L<http://www.raudssus.de/>

=head1 CONTRIBUTORS

Your name could be here.

=head1 COPYRIGHT

Copyright (c) 2010 the Facebook L</AUTHOR> and L</CONTRIBUTORS> as
listed on L<Facebook> and all other packages in this distribution.

=head1 LICENSE

This library is free software and may be distributed under the same terms
as perl itself.

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
	facebook_class => '[% facebook_class || 'Facebook' %]',
	facebook_cookie_class => '[% facebook_cookie_class || 'Facebook::Cookie' %]',
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
