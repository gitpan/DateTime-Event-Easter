use strict;

use Test::More tests => 4;

use DateTime::Event::Easter qw/easter/;

my $easter_sunday_2003 = DateTime->new(
	year  => 2003,
	month => 4,
	day   => 20,
);

my $event_easter_sunday = DateTime::Event::Easter->new(day=>'easter sunday');
my $event_sunday = DateTime::Event::Easter->new(day=>'sunday');

my $event_black_saturday = DateTime::Event::Easter->new(day=>'black saturday');
my $event_saturday = DateTime::Event::Easter->new(day=>'saturday');

my $event_good_friday = DateTime::Event::Easter->new(day=>'good friday');
my $event_friday = DateTime::Event::Easter->new(day=>'friday');

my $event_maundy_thursday = DateTime::Event::Easter->new(day=>'maundy thursday');
my $event_thursday = DateTime::Event::Easter->new(day=>'thursday');

is( $event_easter_sunday->previous($easter_sunday_2003), 
	$event_sunday->previous($easter_sunday_2003), 
	"Day: Easter Sunday & Sunday match",
);

is( $event_black_saturday->previous($easter_sunday_2003), 
	$event_saturday->previous($easter_sunday_2003), 
	"Day: Black Saturday & Saturday match",
);

is( $event_good_friday->previous($easter_sunday_2003), 
	$event_friday->previous($easter_sunday_2003), 
	"Day: Easter Sunday & Sunday match",
);

is( $event_maundy_thursday->previous($easter_sunday_2003), 
	$event_thursday->previous($easter_sunday_2003), 
	"Day: Easter Sunday & Sunday match",
);


