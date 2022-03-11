#!/usr/bin/env ruby
# Id$ nonnax 2022-03-04 16:30:41 +0800
reject=
[
"AddThis Sharing Buttons",
"Share to FacebookFacebook",
"Share to TwitterTwitter",
"Share to PrintPrint",
"Share to Email",
"Share to Pinterest",
"Share to More"
]

ARGF.each_line do |l|
  puts( l ) unless reject.any?{|r| l.match?(r)}
end
