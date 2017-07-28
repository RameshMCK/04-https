require 'httparty'
require 'pry'

p "enter the number of random numbers to be displayed"
x = gets

url = "https://qrng.anu.edu.au/API/jsonI.php?length=#{x}&type=uint16"
#p url
response = HTTParty.get url
#response = HTTParty.get url.parsed_response
#p response
r = response.parsed_response["data"]
#num = r['data']
avg =  r.sum/r.size
p r
p 'average'
p avg



#binding.prytou
#x = 3