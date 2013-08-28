#!/usr/bin/env ruby
# encoding: utf-8

require 'set'

BASE_PATH = File.dirname(__FILE__)
BIB_FILE = File.join(BASE_PATH, 'bibliography.bib')

ALL_AUTHORS = []

File.open(BIB_FILE) do |f|
    f.each do |line|
        if line =~ /^@/ and line !~ /STRING/
            ALL_AUTHORS << line.downcase[/\{(.+),/, 1]
        end
    end
end

puts "Duplicates:"
ALL_AUTHORS.select { |e| ALL_AUTHORS.count(e) > 1 }.uniq.each do |e|
    puts "\t#{e}"
end
