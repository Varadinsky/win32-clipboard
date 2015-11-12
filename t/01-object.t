use strict;
use warnings;
use Test::More;

use Win32::Clipboard;

plan tests => 4;

{
  my $clip = Win32::Clipboard();
  isa_ok($clip, 'Win32::Clipboard');
}

my $clip = Win32::Clipboard->new();

isa_ok($clip, 'Win32::Clipboard');

can_ok ($clip, qw(Set
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

can_ok ('Win32::Clipboard', qw(
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
