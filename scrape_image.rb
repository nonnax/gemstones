#!/usr/bin/env ruby
# Id$ nonnax 2022-03-11 20:08:41 +0800
# f, = ARGV
ARGF.each_line do |section|  
  puts section.gsub(/(?:\()([^\)]+)(?:\))/){
    alt, src=Regexp.last_match[1].split(":")
    "![#{alt}](#{src})"
  }
  puts
end
