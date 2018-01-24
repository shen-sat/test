require 'crack'
require 'open-uri'
require 'json'
require_relative './my_search'

document = File.open('./ufc.html')
content = document.read
xml = Crack::XML.parse(content)

MySearch.new(xml, "xml").search_hash(xml, "Pretty Boy").result
MySearch.new(xml, "xml").search_hash(xml, "Pit Bull").result
MySearch.new(xml, "xml").search_hash(xml, "Arlovski, Andrei").result
MySearch.new(xml, "xml").search_hash(xml, "Barnett, Josh").result
MySearch.new(xml, "xml").search_hash(xml, "Heavyweights (265 lb, 120 kg)").result






 
