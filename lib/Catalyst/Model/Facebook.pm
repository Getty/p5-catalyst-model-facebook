package Catalyst::Model::Facebook;

use Moose;
use Catalyst::Utils;

extends 'Catalyst::Model';
with 'Catalyst::Component::InstancePerContext';

use namespace::autoclean;

our $VERSION = '0.003';
$VERSION = eval $VERSION;

has 'facebook_class' => (
	is => 'ro',
    required => 1,
    lazy     => 1,
    default  => sub { 'Facebook' }
);

has 'facebook_cookie_class' => (
	is => 'ro',
    required => 1,
    lazy     => 1,
    default  => sub { 'Facebook::Cookie' }
);

has 'app_id' => (
	is => 'ro',
    required => 1,
    lazy     => 1,
    default  => sub { die "we need an app id" }
);

has 'secret' => (
	is => 'ro',
    required => 1,
    lazy     => 1,
    default  => sub { die "we need your app secret" }
);

sub get_facebook_cookie {
	my ( $self, $c ) = @_;
}

sub build_per_context_instance {
	my ( $self, $c ) = @_;
	
	Catalyst::Utils::ensure_class_loaded($self->facebook_class);
	Catalyst::Utils::ensure_class_loaded($self->facebook_cookie_class);

	return $self->facebook_class->new(
		cookie => $self->facebook_cookie_class->new(
			catalyst_request => $c->req,
			app_id => $self->app_id,
			secret => $self->secret,
		),
	);
	
}

1;

=encoding utf8

=head1 NAME

Catalyst::Model::Facebook - The Catalyst model for the package Facebook

=head1 SYNOPSIS

  #
  # Config
  #
  <Model::MyModel>
    app_id 148266808552034
    secret 7adde7e516bf42ec914b08c8d075c13d
    facebook_class Facebook
    facebook_cookie_class Facebook::Cookie
  </Model::MyModel>

  #
  # Sample controller code
  #
  sub index :Chained('base') :PathPart('') :Args {
    my ( $self, $c ) = @_;

    if ($c->model('MyModel')->uid) {
      $c->stash->{facebook_user_profile} = $c->model('Facebook')->graph->query
        ->find($c->model('MyModel')->uid)
        ->include_metadata
        ->request
        ->as_hashref;
    }

  }
  
=head1 DESCRIPTION

This package wraps around the L<Facebook> package. It uses the L</facebook_cookie_class> where it gives over L</app_id>, L</secret>
and the text of the facebook cookie of this L</app_id>. This object will be used as cookie attribute for the construction of the
L</facebook_class>. 

=head1 CONFIG PARAMETERS

=head2 app_id

The application id you got from your L<http://www.facebook.com/developers> application page.

=head2 secret

The application secret you got from your L<http://www.facebook.com/developers> application page.

=head2 facebook_class

If you want to extend the L<Facebook> class, or want to use an alternative implementation which is compatible, you can set here the
class that should be used for this adapter.

=head2 facebook_cookie_class

With this parameter you can give him a different L<Facebook::Cookie> class which he gives as cookie attribute to the L<Facebook> object
on construction.

=head1 SEE ALSO

L<Catalyst::Helper::Model::Facebook>

L<Facebook>

L<Facebook::Cookie>

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