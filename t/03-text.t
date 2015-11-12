use strict;
use warnings;
use Test::More;

use Win32::Clipboard;

plan tests => 12;

my $clip = Win32::Clipboard->new();

my $text = "This is some text...";

$clip->Set($text);

is ($clip->Get(), $text, "Fetch value from clipboard");

is ($clip->GetText(), $text, "Fetch value from clipboard as text");

ok (!$clip->GetBitmap(), "Value is not a bitmap");

ok (!$clip->GetFiles(), "Value is not a list of files");

ok ($clip->IsText, "Value is text.");

ok (!$clip->IsBitmap, "Value is not a bitmap.");

ok (!$clip->IsFiles, "Value is not a list of files.");

ok ($clip->IsFormatAvailable(CF_TEXT), "Clipboard contains text.");

ok (!$clip->IsFormatAvailable(CF_DIB), "Clipboard does not contain a bitmap.");

ok (!$clip->IsFormatAvailable(CF_HDROP), "Clipboard does not contain a list of files");

is_deeply ([$clip->EnumFormats()], [ CF_TEXT,CF_LOCALE,CF_OEMTEXT,CF_UNICODETEXT ], "Check format of clipboard data.");

$clip->Empty();

is ($clip->Get(), '', "Clipboard is empty");
