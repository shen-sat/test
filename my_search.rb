class MySearch
  def initialize(root, hash_name)
    @root = root
    @found = false
    @path = []
    @hash_name = hash_name
  end
  
  def search_array(array, term)
    array.each do |e|
      if e == term
        puts "Match found: #{e}" if @found == false
        @found = true
        @path.push([array.index(e)])
        search_hash(@root, array)
      elsif e.is_a?(Hash)
        search_hash(e, term)
      elsif e.is_a?(Array)
        search_array(e, term)
      end
    end
    return self
  end
  
  def search_hash(hash, term)
    hash.each do |k,v|
      if v == term
        puts "Match found: #{v}" if @found == false
        @found = true
        @path.push([k])
        search_hash(@root, hash)
      elsif v.is_a?(Hash)
        search_hash(v, term)
      elsif v.is_a?(Array)
        search_array(v, term)
      end
    end
    return self
  end

  def result
    path_reverse = @path.reverse
    print @hash_name
    path_reverse.each do |e|
      print e.to_s
    end
    puts ""
  end

end