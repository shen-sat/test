require_relative './output_names'

output = Output.new
puts output.first_names(1, output.find_table_max)
