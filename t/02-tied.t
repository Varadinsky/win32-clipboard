use strict;
use warnings;
use Test::More tests => 3;
use Win32::Clipboard;

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
