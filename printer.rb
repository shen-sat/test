require_relative './my_search'
require_relative './test'

p = xml["html"]["body"]["div"][2]["div"][2]["div"][3]["div"]["table"][4]["tr"][7]["td"][2]["span"][0]
puts p