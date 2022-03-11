#!/usr/bin/env ruby
# Id$ nonnax 2022-03-04 16:30:41 +0800

ARGF.each_line do |l|
  # puts l if l.match?(/shadow/i)
  # l.gsub!(/(?<=[^\s])shadow\b/i, '') if l.match?(/shadow/i)
  l.gsub!(/shadow/i, '') if l.match?(/^shadow$/i)
  puts( l )
end
