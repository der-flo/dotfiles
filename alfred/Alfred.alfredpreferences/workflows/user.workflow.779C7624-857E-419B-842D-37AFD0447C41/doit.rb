require 'open-uri'
require 'json'

gem_name = ARGV.first.gsub(' ', '+')
response = open("https://rubygems.org/api/v1/search.json?query=#{gem_name}").read
gems = JSON.parse(response)
exit if gems.empty?


def puts_item(g, index)
  puts "  <item uid='#{index * 10}' arg='#{g["project_uri"]}'>"
  puts "    <title>#{g['name']} - RubyGems.org (#{g['version']})</title>"
  puts "    <subtitle>#{g['info'].strip}</subtitle>"
  puts '    <icon>icon.png</icon>'
  puts '  </item>'
end

def puts_min_item(index, offset, url, title)
  puts "  <item uid='#{index * 10 + offset}' arg='#{url}'>"
  puts "    <title>#{title}</title>"
  puts "    <subtitle>#{url}</subtitle>"
  puts '  </item>'
end

puts '<?xml version="1.0"?>'
puts '<items>'

gems.each_with_index do |g, index|
  puts_item(g, index)
  puts_min_item(index, 1, g['source_code_uri'], "#{g['name']} - source code") if g['source_code_uri']
  puts_min_item(index, 2, g['documentation_uri'], "#{g['name']} - docs") if g['documentation_uri']
  puts_min_item(index, 3, g['homepage_uri'], "#{g['name']} - homepage") if g['homepage_uri']
end

puts '</items>'
