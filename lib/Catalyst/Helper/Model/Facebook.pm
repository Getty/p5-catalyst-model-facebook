package Catalyst::Helper::Model::Facebook;
# ABSTRACT: Helper for Facebook models
use strict;
use warnings;

=pod

=head1 SYNOPSIS

  script/myapp_create.pl model MyModel Facebook app_id api_key secret [facebook_class] [facebook_signed_class]

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
    my ( $self, $helper, $app_id, $api_key, $secret, $facebook_class, $facebook_signed_class ) = @_;

	my %args = (
		app_id => $app_id,
		api_key => $api_key,
		secret => $secret,
		facebook_class => $facebook_class,
		facebook_signed_class => $facebook_signed_class,
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
	api_key => '[% api_key %]',
	secret => '[% secret %]',
	facebook_class => '[% facebook_class || 'Facebook' %]',
	facebook_signed_class => '[% facebook_signed_class || 'Facebook::Signed' %]',
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
