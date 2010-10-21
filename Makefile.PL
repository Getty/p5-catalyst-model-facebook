use inc::Module::Install;

name 'Catalyst-Model-Facebook';

perl_version '5.008';
license 'perl';
all_from 'lib/Catalyst/Model/Facebook.pm';

requires 'Catalyst::Runtime' => 5.80;
requires 'Facebook';
requires 'namespace::autoclean';

test_requires 'Test::More';

auto_install;

WriteAll;
