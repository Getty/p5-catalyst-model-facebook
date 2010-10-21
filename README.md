# NAME

Catalyst::Model::Facebook - The Catalyst model for the package Facebook

# SYNOPSIS

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
  

# DESCRIPTION

This package wraps around the [Facebook](http://search.cpan.org/perldoc?Facebook) package. It uses the L</facebook_cookie_class> where it gives over L</app_id>, L</secret>
and the text of the facebook cookie of this L</app_id>. This object will be used as cookie attribute for the construction of the
L</facebook_class>. 

# CONFIG PARAMETERS

## app_id

The application id you got from your <http://www.facebook.com/developers> application page.

## secret

The application secret you got from your <http://www.facebook.com/developers> application page.

## facebook_class

If you want to extend the [Facebook](http://search.cpan.org/perldoc?Facebook) class, or want to use an alternative implementation which is compatible, you can set here the
class that should be used for this adapter.

## facebook_cookie_class

With this parameter you can give him a different [Facebook::Cookie](http://search.cpan.org/perldoc?Facebook::Cookie) class which he gives as cookie attribute to the [Facebook](http://search.cpan.org/perldoc?Facebook) object
on construction.

# SEE ALSO

[Catalyst::Helper::Model::Facebook](http://search.cpan.org/perldoc?Catalyst::Helper::Model::Facebook)

[Facebook](http://search.cpan.org/perldoc?Facebook)

[Facebook::Cookie](http://search.cpan.org/perldoc?Facebook::Cookie)

# SUPPORT

IRC

  Join #facebook on irc.perl.org.

Repository

  http://github.com/Getty/p5-catalyt-model-facebook
  Pull request and additional contributors are welcome
 

Issue Tracker

  http://github.com/Getty/p5-catalyt-model-facebook/issues

# AUTHOR

Torsten Raudssus <torsten@raudssus.de> <http://www.raudssus.de/>

# CONTRIBUTORS

Your name could be here.

# COPYRIGHT

Copyright (c) 2010 the Facebook L</AUTHOR> and L</CONTRIBUTORS> as
listed on [Facebook](http://search.cpan.org/perldoc?Facebook) and all other packages in this distribution.

# LICENSE

This library is free software and may be distributed under the same terms
as perl itself.