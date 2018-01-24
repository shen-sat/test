require 'crack'
require 'open-uri'
require 'json'

document = File.open('./ufc.html')
content = document.read
xml = Crack::XML.parse(content)


def search_array(array, term)
  array.each do |e|
    if e.is_a?(Hash)
      search_hash(e, term)
    elsif e.is_a?(Array)
      search_array(e, term)
    elsif e == term
      puts  "Match found: #{e}"
    else
      #puts "unidentified"
    end
  end
end


def search_hash(hash, term)
  hash.each do |k,v|
    if v.is_a?(Hash)
      search_hash(v, term)
    elsif v.is_a?(Array)
      search_array(v, term)
    elsif v == term
      puts "Match found: #{v}"
    else
      #puts "unidentified"
    end
  end
end

search_hash(xml, "Bamgbose, Oluwale")







 
