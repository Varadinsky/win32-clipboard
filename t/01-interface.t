use strict;
use warnings;
use Test::More tests => 7;
use Win32::Clipboard;

{
  my $clip = Win32::Clipboard();
  isa_ok($clip, 'Win32::Clipboard');
}

my @methods = qw(Set
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
                );
# OO Interface
{
  my $clip = Win32::Clipboard->new();
  isa_ok($clip, 'Win32::Clipboard');
  can_ok ($clip, @methods);
}

# Function Interface
can_ok ('Win32::Clipboard', @methods);

# Tied variable interface
{
  my $clip;
  tie $clip, 'Win32::Clipboard';

  ok (tied($clip), "Tied Win32-Clipboard variable");
  isa_ok(tied($clip), 'Win32::Clipboard');
  can_ok (tied($clip), @methods);
}
