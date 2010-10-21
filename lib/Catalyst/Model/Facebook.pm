package Catalyst::Model::Facebook;

use Moose;
use Catalyst::Utils;

extends 'Catalyst::Model';
with 'Catalyst::Component::InstancePerContext';

use namespace::autoclean;

our $VERSION = '0.001';
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