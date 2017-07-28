
require 'httparty'

url= "https://tempramesh.stamplayapp.com/api/cobject/v1/dog"

#get the detail
r = HTTParty.get(url).parsed_response
p r
#insert the data

# curl --request POST \
#   --url https://tempramesh.stamplayapp.com/api/cobject/v1/dog \
#   -H 'content-type: application/json' \
#   -d '{"foo" : "bar"}'
  
HTTParty.post(url, {body: {name: 'fabulous', age:5, weight: 33.2 }} )   
r1 = HTTParty.get(url).parsed_response

#insert multiple records using post method
10.times do |i| 
    name = "rexydo #{i}"
    age = i * i
    weight = i * 2

HTTParty.post(url, {body: {name: "#{name}", age:"#{age}", weight: "#{weight}" }} )     
end
