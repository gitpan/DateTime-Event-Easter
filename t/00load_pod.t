# -*- perl -*-

# t/00load_pod.t - check module loading and documentation

use Test::More tests => 3;

BEGIN { use_ok( 'DateTime::Event::Easter' ); }

my $object = DateTime::Event::Easter->new ();
isa_ok ($object, 'DateTime::Event::Easter');


SKIP: {
	eval{ require Test::Pod };
	skip "Test::Pod isn't installed. Believe me: the POD is ok!", 1 if $@;
	
	Test::Pod::pod_file_ok('lib/DateTime/Event/Easter.pm','Pod tests OK');
}


