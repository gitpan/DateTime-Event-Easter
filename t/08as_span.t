use strict;

use Test::More tests => 4;

use DateTime::Event::Easter qw/easter/;

my $post_easter_2003 = DateTime->new(
	year  => 2003,
	month => 8,
	day   => 28,
);
my $just_before = DateTime->new(
	year => 2003, month  => 4,  day    => 19,
	hour => 23,   minute => 59, second => 59, nanosecond => 999999999
);
my $just_after = DateTime->new(
	year => 2003, month  => 4,  day    => 21,
	hour => 0,    minute => 0,  second => 0,  nanosecond => 1
);



my $event_easter_sunday = DateTime::Event::Easter->new(
	day => 'easter sunday',
	as  => 'span',
);

my $span_easter_sunday = $event_easter_sunday->previous($post_easter_2003);

is( $span_easter_sunday->min->datetime, 
	'2003-04-20T00:00:00', 
	"Easter Sunday span starts at midnight",
);

is( $span_easter_sunday->max->datetime, 
	'2003-04-21T00:00:00', 
	"Easter Sunday span end at following midnight",
);

is( $span_easter_sunday->contains( $just_before ), 
	0,
	"Previous dates are not included",
);

is( $span_easter_sunday->contains( $just_after ), 
	0,
	"Following dates are not included",
);
