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

class Output
  def initialize
    document = File.open('./ufc.html')
    content = document.read
    @xml = Crack::XML.parse(content)
  end

  def find_table_max
    my_range = (1..100)
    table_number = 0
    my_range.each do |number|
      table_number = number
      #NOTE TO SELF: THE REASON YOU COULDNT RAISE AN ERROR HERE IS BECAUSE IF table_number is nil, you don't call anything on it, and so it never raises and error, it simply returns nil
      test_table = @xml["html"]["body"]["div"][2]["div"][2]["div"][3]["div"]["table"][table_number]
      break if test_table.nil?   
    end
    table_max = table_number - 1
    return table_max  
  end

  def print_names(table_number, table_max)
    my_range = (1..100)
    begin
      my_range.each do |replace|
        n = replace
        value = @xml["html"]["body"]["div"][2]["div"][2]["div"][3]["div"]["table"][table_number]["tr"][n]["td"][2]["span"][0]
        puts value
      end
    rescue => e
      puts e
      puts "Either table not formatted as expected, or END OF TABLE"
      if table_number < table_max
        table_number += 1
        print_names(table_number, table_max)
      end
    end
  end

end

output = Output.new
output.print_names(1, output.find_table_max)

#print_names(1,find_table_max)
#find_table_max



 
