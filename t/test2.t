use strict;
use warnings;

# Basicaly the same as test.t but using Test::More instead of the raw TAP output.

# dmake realclean; perl Makefile.PL; dmake test

use Test::More tests => 11;

use_ok('Win32::Clipboard');

my $clip = Win32::Clipboard();
isa_ok($clip, 'Win32::Clipboard');

# Ovo bi valjalo dopuniti
can_ok ($clip, qw(Set
                  Get
                  Empty
                  WaitForChange
                  GetText
                  ));


my $test_string = 'Win32::Clipboard test';
$clip->Set($test_string);

is ($clip->Get(), $test_string, "Fetch value from clipboard");

ok ($clip->IsText,"Value is text");

$clip->Empty();

ok (!$clip->Get(), "Clipboard is empty");

undef $clip;


# TIED part - should be in separate test file.

tie $clip, 'Win32::Clipboard';

ok (tied($clip), "Tied Win32-Clipboard");

isa_ok(tied($clip), 'Win32::Clipboard');

$clip = $test_string;
my $actual = $clip;
is ($actual, $test_string, "Fetch value from clipboard tied");

ok (tied($clip)->IsText(), "Value is text");

tied($clip)->Empty();

ok (!$clip, "clipboard is empty");
