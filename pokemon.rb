require 'httparty'
require 'pry'


p "enter the type of pokemon"
x = gets

url = "http://pokeapi.co/api/v2/type/#{x}".chomp    

#p url
response = HTTParty.get url
#p response
r = response.parsed_response

names = r['pokemon'].map{|p| p['pokemon']['name']}
p names
#
#r1 = r["pokemon"][0]
#pout = pout['pokemon']
#p r1

#binding.pry
#x =3




