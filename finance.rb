require "httparty"
require "pry"


p "enter the stock ticker"
#chomp removes new line characters
s = gets.chomp.upcase

url ="https://www.google.com/finance/getprices?q=#{s}&x=NASD&i=120&p=25m&f=d,c,v,o,h,l&df=cpct&auto=1&ts=1501179683973&ei=vCl6WbGZHNSP2Abo3KPoDg"

#loop through the stock ticker 
while true do 
r = HTTParty.get url
#convert the data into array using split
arr = r.split
#move tto the last row
lstStr= arr.last.split(",")
#get the required column
outout =  "#{s} => #{lstStr[4]}"
p outout#lstStr[4]

sleep 2
end
#binding.pry
#x=3