#!/usr/bin/env ruby
# frozen_string_literal: true

# Id$ nonnax 2022-02-27 12:43:59 +0800
require 'json'
require 'rubytools/array_csv'
require 'rubytools/array_table'
require 'rubytools/ansi_color'
require 'rubytools/cache'

def putj(h)
  puts JSON.pretty_generate(h)
end

months = %i[jan feb mar apr may jun jul aug sep oct nov dec]
gemstones_primary = %w[garnet amethyst aquamarine diamond emerald alexandrite ruby peridot sapphire tourmaline topaz
                       tanzanite]

book = months.each_with_object({}) do |e, hsh|
  hsh[e] = { primary: [], secondary: [] }
end
gem_primary = months.zip(gemstones_primary).to_h
months.map { |m| book[m][:primary] << gem_primary[m] }

# gemstones=ArrayCSV.new('gemchart.csv')
# gemstones<<[:class]+months
# gemstones<<[:primary]+gemstones_primary

extra = months.zip(Array.new(12) { nil }).to_h
extra[:mar] = 'blood stone'
extra[:jun] = 'pearl'
extra[:aug] = 'spinel, sardonyx'
extra[:oct] = 'opal'
extra[:nov] = 'citrine'
extra[:dec] = 'turquoize, lapis lazuli'

putj extra

extra.each do |k, v|
  val = v&.match(/,/) ? v.split(/,/).map(&:strip) : [v].compact
  book[k][:secondary] += val
end

tab=book.each_slice(3).to_a.map do |sl|
  # puts sl.transpose.to_table
  sl.map do |m, stones|
     prim, sec = stones.values
     [m, prim.join(', '), sec.join(', ')].flatten(1)
  end.flatten(1)
  
end

# puts tab.to_table
puts 
tab.to_table(ljust: (0..4), delim: "\t").each_with_index{|r, i|
  # puts '.'*80
  puts i%2==0 ? r.magenta : r.cyan
  # puts '-'*110
  # puts
}
# gemstones<<[:secondary]+list.values
