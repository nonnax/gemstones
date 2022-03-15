#!/usr/bin/env ruby
# Id$ nonnax 2022-03-14 15:41:10 +0800
ARGF.each do |l|
  if l.match /(Source)\s:\s(http.+$)/i
    puts format "{%<doc>s}", doc: l.chomp.gsub(/(Source)\s:\s(http.+$)/i, '[\1](\2)')
  else
    print l
  end
end
