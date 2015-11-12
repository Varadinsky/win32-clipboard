use strict;
use warnings;
use Test::More;

use Win32::Clipboard;

plan tests => 3;

my $clip;

tie $clip, 'Win32::Clipboard';

ok (tied($clip), "Tied Win32-Clipboard");

isa_ok(tied($clip), 'Win32::Clipboard');

can_ok (tied($clip), qw(
                  Set
                  Empty
                  WaitForChange
                  EnumFormats
                  Get
                  GetAs
                  GetBitmap
                  GetFiles
                  GetFormatName
                  GetText
                  IsBitmap
                  IsFiles
                  IsFormatAvailable
                  IsText
                  ));
