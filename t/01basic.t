use strict;

use Test::More tests => 12;

use DateTime::Event::Easter qw/easter/;

my $easter_sunday_2003 = DateTime->new(
	year  => 2003,
	month => 4,
	day   => 20,
);

my $zone_2003 = DateTime->new(
	year  => 2003,
	month => 10,
	day   => 1,
);

my $pre_zone_2003 = DateTime->new(
	year  => 2003,
	month => 8,
	day   => 1,
);

my $post_zone_2003 = DateTime->new(
	year  => 2003,
	month => 11,
	day   => 1,
);

my $event_easter_sunday = DateTime::Event::Easter->new();

is( $event_easter_sunday->previous($easter_sunday_2003)->ymd, '2002-03-31', "Easter Sunday 2003: Check the previous" );
is( $event_easter_sunday->following($easter_sunday_2003)->ymd, '2004-04-11', "Easter Sunday 2003: Check the following" );
is( $event_easter_sunday->closest($easter_sunday_2003)->ymd, '2003-04-20', "Easter Sunday 2003: Check the closest" );

is( $event_easter_sunday->previous($zone_2003)->ymd, '2003-04-20', "Zone 2003: Check the previous" );
is( $event_easter_sunday->following($zone_2003)->ymd, '2004-04-11', "Zone 2003: Check the following" );
is( $event_easter_sunday->closest($zone_2003)->ymd, '2003-04-20', "Zone 2003: Check the closest" );

is( $event_easter_sunday->previous($pre_zone_2003)->ymd, '2003-04-20', "Pre-Zone 2003: Check the previous" );
is( $event_easter_sunday->following($pre_zone_2003)->ymd, '2004-04-11', "Pre-Zone 2003: Check the following" );
is( $event_easter_sunday->closest($pre_zone_2003)->ymd, '2003-04-20', "Pre-Zone 2003: Check the closest" );

is( $event_easter_sunday->previous($post_zone_2003)->ymd, '2003-04-20', "Post-Zone 2003: Check the previous" );
is( $event_easter_sunday->following($post_zone_2003)->ymd, '2004-04-11', "Post-Zone 2003: Check the following" );
is( $event_easter_sunday->closest($post_zone_2003)->ymd, '2004-04-11', "Post-Zone 2003: Check the closest" );


