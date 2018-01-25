require 'crack'
require 'open-uri'
require 'json'
require_relative './my_search'

#document = File.open('./ufc.html')
#content = document.read
#xml = Crack::XML.parse(content)


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






def print_names(table_number)
  document = File.open('./ufc.html')
  content = document.read
  xml = Crack::XML.parse(content)
  my_range = (1..100)
  begin
    my_range.each do |replace|
      n = replace
      value = xml["html"]["body"]["div"][2]["div"][2]["div"][3]["div"]["table"][table_number]["tr"][n]["td"][2]["span"][0]
      puts value
    end
  rescue 
    puts "There is an error:"
    if table_number < 6
      table_number += 1
      print_names(table_number)
    end
  end
end

print_names(4)



 
