#!/usr/bin/env ruby
# frozen_string_literal: true

# Id$ nonnax 2022-03-11 20:08:41 +0800
ARGF.read.scan(/\{([^\}]+)\}/m).each do |section|
  puts section
  puts
end
