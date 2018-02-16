require 'crack'
require 'open-uri'
require 'json'
require_relative './my_search'

document = File.open('./ufc.html')
content = document.read
xml = Crack::XML.parse(content)


=begin
MySearch.new(xml, "xml").search_hash(xml, "Duffee, Todd").result
MySearch.new(xml, "xml").search_hash(xml, "Heavyweights (265 lb, 120 kg)").result
puts ""
MySearch.new(xml, "xml").search_hash(xml, "Okami, Yushin").result
MySearch.new(xml, "xml").search_hash(xml, "Light heavyweights (205 lb, 93 kg)").result
puts ""
MySearch.new(xml, "xml").search_hash(xml, "Boetsch, Tim").result
MySearch.new(xml, "xml").search_hash(xml, "Middleweights (185 lb, 84 kg)").result
=end

MySearch.new(xml, "xml").search_hash(xml, "Vai Cavalo").result
MySearch.new(xml, "xml").search_hash(xml, "The Menace").result
MySearch.new(xml, "xml").search_hash(xml, "The Beefcake").result
MySearch.new(xml, "xml").search_hash(xml, "The Karate Hottie").result

