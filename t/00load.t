# -*- perl -*-

# t/001_load.t - check module loading and create testing directory

use Test::More tests => 2;

BEGIN { use_ok( 'DateTime::Event::Easter' ); }

my $object = DateTime::Event::Easter->new ();
isa_ok ($object, 'DateTime::Event::Easter');


