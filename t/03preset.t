use strict;

use Test::More tests => 5;

use DateTime::Event::Easter qw/easter/;

my $post_easter_2003 = DateTime->new(
	year  => 2003,
	month => 8,
	day   => 28,
);

my $event_easter_sunday = DateTime::Event::Easter->new(day=>'easter sunday');
is( $event_easter_sunday->previous($post_easter_2003)->ymd, 
	'2003-04-20', 
	"Day: Easter Sunday is correct",
);

my $event_black_saturday = DateTime::Event::Easter->new(day=>'black saturday');
is( $event_black_saturday->previous($post_easter_2003)->ymd, 
	'2003-04-19', 
	"Day: Black Saturday is correct",
);

my $event_good_friday = DateTime::Event::Easter->new(day=>'good friday');
is( $event_good_friday->previous($post_easter_2003)->ymd, 
	'2003-04-18', 
	"Day: Good Friday is correct",
);

my $event_maundy_thursday = DateTime::Event::Easter->new(day=>'maundy thursday');
is( $event_maundy_thursday->previous($post_easter_2003)->ymd, 
	'2003-04-17', 
	"Day: Maundy Thursday is correct",
);

my $event_pentecost = DateTime::Event::Easter->new(day=>49);
is( $event_pentecost->previous($post_easter_2003)->ymd, 
	'2003-06-08', 
	"Day: +49 is correct",
);


