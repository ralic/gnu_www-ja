# PlanetRSS: fetch feeds from planetgnu.org and output them as HTML.
#
# Copyright © 2011 Shailesh Ghadge
# Copyright © 2013, 2014, 2015 Free Software Foundation, Inc.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# Email: webmasters@gnu.org

use strict;

use encoding "utf-8";

# Provides simple pure perl RSS parsing.
use XML::RSS::Parser::Lite;

# Provides get(url) function.
use LWP::Simple;

# Provides argument handling.
use Getopt::Long;

my $Version = "1.10";
my $default_lines = 3;
my $default_length = 200;
# GNU Remotecontrol Newsletter doesn't produce meaningful feeds;
# skip it by default.
my $default_exclude_pattern = '^GNU Remotecontrol: Newsletter';
my $head = "<!-- Autogenerated by planetrss.pl ".$Version." -->\n";

# Number of feeds to output.
my $FeedLines = $default_lines;

# Number of characters per feed.
my $FeedLength = $default_length;

# Regex for excluded titles
my $exclude_pattern = $default_exclude_pattern;

# Other options.
my $a = 0;
my $b = 0;
my $code = 0;
my $div = 0;
my $em = 0;
my $h = 0;
my $hr = 0;
my $i = 0;
my $img = 0;
my $p = 0;
my $pre = 0;
my $strong = 0;
my $table = 0;
my $textarea = 0;
my $tt = 0;
my $ul = 0;
my $help;
my $version;

sub strip_tag
{
  my $str = shift;
  my $tag = shift;
  my $repl = shift;

  $str =~ s/&lt;$tag(.*?)&gt;/$repl/gi;
  $str =~ s/&lt;\/$tag&gt;//gi;

  return $str;
}

my $feeds = get ("http://planet.gnu.org/rss20.xml");

GetOptions ("a=i" => \$a, "b=i" => \$b, "code=i" => \$code, "div=i" => \$div,
            "em=i" => \$em, "h=i" => \$h, "hr=i" => \$hr, "i=i" => \$i,
            "img=i" => \$img, "p=i" => \$p, "pre=i" => \$pre,
            "strong=i" => \$strong, "table=i" => \$table,
            "textarea=i" => \$textarea, "tt=i" => \$tt, "ul=i" => \$ul,
            "FeedLines=i" => \$FeedLines, "FeedLength=i" => \$FeedLength,
            "exclude=s" => \$exclude_pattern,
            "help" => \$help, "version" => \$version);

if ($help)
  {
    print "Usage: perl planetrss.pl [options]

Options:

    -FeedLines=n       The number of feeds to output
    -FeedLength=m      The length of feed

    -a=1            preserve a href tags
    -b=1            preserve b tags
    -code=1         preserve code tags
    -div=1          preserve div tags
    -em=1           preserve em tags
    -exclude=regex  exclude entries whose title match this pattern
    -h=1            preserve h tags
    -hr=1           preserve hr tags
    -i=1            preserve i tags
    -img=1          preserve img tags
    -p=1            preserve p tags
    -pre=1          preserve pre tags
    -strong=1       preserve strong tags
    -table=1        preserve tables
    -textarea=1     preserve textarea tags
    -tt=1           preserve tt tags
    -ul=1           preserve ul, ol, dl, li tags

    -help           Display help and exit
    -version        Display version and exit

Defaults:
    -FeedLines=".$default_lines." -FeedLength=".$default_length."
    -exclude='".$default_exclude_pattern."'

Examples:
    perl planetrss.pl -FeedLines=7 -FeedLength=500
    perl planetrss.pl -version
    perl planetrss.pl -help
    perl planetrss.pl -i=1 -hr=1 -a=1

";
    exit;
  }

if ($version)
  {
    print "PlanetRSS ".$Version."
Copyright (C) 2011 Shailesh Ghadge
Copyright (C) 2013, 2014, 2015 Free Software Foundation, Inc.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

";
    exit;
  }

my $PGparser = new XML::RSS::Parser::Lite;
my $gnun_split = "<span class=\"gnun-split\"></span>";

$PGparser->parse ($feeds);

print $head;

my $skipped = 0;
for (my $i = 0; $i - $skipped < $FeedLines; $i++)
  {
    my $feed  = $PGparser->get ($i);
    my $url   = $feed->get ('url');
    my $title = $feed->get ('title');
    my $desc  = $feed->get ('description');
    my $tail  = "...\n".$gnun_split."<a href='".$url."'>"
                .$gnun_split."more".$gnun_split."</a>";
    my $d0;

    if ($title =~ /$exclude_pattern/)
      {
        $skipped++;
        next;
      }
    $head  = ":\n";

    # Remove Blog name.
    $title = substr ($title, index ($title, ':') + 2);

    # Check whether there are at least 12 characters for description.
    $desc = "" unless length ($title) < ($FeedLength - 23);

    # Sanitize description.
    $desc =~ s/&lt;br \/&gt;//gi; $desc =~ s/\s\s+/ /g;
    $desc = strip_tag ($desc, "span");
    $desc = strip_tag ($desc, "a") unless $a == 1;
    $desc = strip_tag ($desc, "b") unless $b == 1;
    $desc = strip_tag ($desc, "code") unless $code == 1;
    $desc = strip_tag ($desc, "div") unless $div == 1;
    $desc = strip_tag ($desc, "em") unless $em == 1;
    $desc = strip_tag ($desc, "i") unless $i == 1;
    $desc = strip_tag ($desc, "img") unless $img == 1;
    $desc = strip_tag ($desc, "h\d") unless $h == 1;
    $desc = strip_tag ($desc, "hr") unless $hr == 1;
    $desc = strip_tag ($desc, "p") unless $p == 1;
    $desc = strip_tag ($desc, "pre") unless $pre == 1;
    $desc = strip_tag ($desc, "strong") unless $strong == 1;
    if ($table != 1)
      {
        $desc = strip_tag ($desc, "table");
        $desc = strip_tag ($desc, "tbody");
        $desc = strip_tag ($desc, "t[hrd]");
        $desc = strip_tag ($desc, "col");
        $desc = strip_tag ($desc, "colgroup");
      }
    if ($textarea != 1)
      {
        $desc = strip_tag ($desc, "textarea");
        $desc =~ s/<textarea(.*?)>//gi; $desc=~ s/<\/textarea>//gi;
      }
    $desc = strip_tag ($desc, "tt") unless $tt == 1;
    if ($ul != 1)
      {
        $desc = strip_tag ($desc, "[duo]l");
        $desc = strip_tag ($desc, "li", " * ");
      }
    $desc =~ s/&lt;/</gi; $desc =~ s/&gt;/>/gi;
    $desc =~ s/&amp;lt;/&lt;/gi; $desc =~ s/&amp;gt;/&gt;/gi;
    $desc =~ s/&quot;/"/gi;
    $desc =~ s/(&amp;)amp;/$1/gi;
    $desc =~ s/\s\s+/ /g;

    # Empty description: no "more", no ":".
    $tail = "" unless length ($desc);
    $head = "" unless length ($desc);

    $d0 = $desc;

    if($a == 1) # a tags are included
      {
        # Will this work when other tags are included?
        my $start_a;
        my $end_a;
        my $front = substr($desc, 0,($FeedLength-(10+length($title))));
        my $rear = substr($desc, ($FeedLength-(10+length($title))));

        if(substr($front,($FeedLength-(10+length($title))-1)) eq "<")
          {
            # Avoid line cut at '<'.
            $front = substr($desc, 0,($FeedLength-(10+length($title)))+1);
            $rear = substr($desc, ($FeedLength-(10+length($title)))+1);
          }

        while ($front =~ /<a/gi) { $start_a++ }
        while ($front =~ /<\/a>/gi) { $end_a++ }

        $front = $front.substr($rear,0,index($rear,'</a>') + 4)
                 unless $start_a == $end_a;
        $desc = $front;
      }
    else # a tags are removed
      {
        $desc = substr($desc, 0, ($FeedLength-(10+length($title))));
      }

    # If we print whole description, there is no "more".
    $tail = "" unless $d0 ne $desc;

    # Kill trailing spaces and possible start of tag.
    $desc =~ s/[<\s]*$//;

    if ($tail ne "")
      {
        # Kill ending commas.
        $desc =~ s/[.,:;]*$//;
        # Produce "!.." and "?.." rather than "!..." and "?...".
        $tail =~ s/.// if $desc =~ /[!?]$/;
      }

    print "<p><a href='".$url."'>\n".$gnun_split.$title.$gnun_split
          ."</a>".$gnun_split.$head.$desc.$tail."</p>\n";
  }
