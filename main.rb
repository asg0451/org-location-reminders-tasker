#!/usr/bin/env ruby
require 'org-ruby'
require 'json'
require 'byebug'

locationsMap = JSON.load(IO.read('locationsMap.json'))
test_org = Orgmode::Parser.new(IO.read('test.org'))
headlines = test_org.headlines

# generate test.json
output = {}
headlines.each do |h|
  next if h.tags.length == 0
  h.tags.each do |t|
    output[locationsMap[t]] = h.headline_text
  end
end

IO.write('test.json', JSON.generate(output))
