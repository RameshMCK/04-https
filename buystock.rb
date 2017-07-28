require "httparty"
require "pry"


p "enter the customer namer"
#chomp removes new line characters
name = gets.chomp

#customer url
customerurl = "https://tempramesh.stamplayapp.com/api/cobject/v1/customer?name=#{name}"

customerresponse = HTTParty.get(customerurl).parsed_response
#p stockresponse
balance = customerresponse["data"][0]["cashbalance"]
id = customerresponse["data"][0]["id"]
#p "Balance for #{name} is = #{balance}"
#p "customer IDr #{name} is = #{id}"

customerupdurl = "https://tempramesh.stamplayapp.com/api/cobject/v1/customer/#{id}"


#stock ur
stockurl = "https://tempramesh.stamplayapp.com/api/cobject/v1/custstocks?name=#{name}"
#p stockurl
#view balance

p "Enter a stock symbol: "
symbol = gets.chomp.upcase

    r = HTTParty.get("https://www.google.com/finance/getprices?q=#{symbol}&x=NASD&i=120&p=15m&f=c&df=cpct").body
    price = r.split("\n").last.to_f.round(2)
    #puts "#{symbol} => $#{price}"

 p "enter the qty"
 qty = gets.chomp

 if qty.to_i * price.to_f <= balance.to_f
     totalprice  = qty.to_i * price.to_f
     totalprice  = totalprice.round(2)
     balance = balance.to_f - totalprice.to_f
     balance = balance.round(2)
 end

#binding.pry
#insert into customer stocks table
HTTParty.post(stockurl, {body: {name: "#{name}", price:"#{price}", qty:"#{qty}", symbol: "#{symbol}" , total: "#{totalprice}"}} )  
#update the balance in the customer table
HTTParty.put(customerupdurl, {body: {name: "#{name}", cashbalance:"#{balance}"}} )  

#view purchases

customerpurchase = HTTParty.get(stockurl).parsed_response

cusres = customerpurchase["data"]
len = cusres.size

p "----------------------------------------------------"
p "Balance for #{name} is = #{balance}"
p "----------------------------------------------------"

i=0
p "---------purchase history of #{name}----------------"
p "name" + " | " + 'symbol'+ " | " + 'qty'+ " | " + 'price'
p "----------------------------------------------------"
while i < len do
    
    result = cusres[i]['name'] + " | " + cusres[i]['symbol']+ " | " + cusres[i]['qty'].to_s+ " | " + cusres[i]['price'].to_s
    p result
    i +=1
   end 




#url https://tempramesh.stamplayapp.com/api/cobject/v1/custstocks/[CUSTSTOCKS INSTANCE ID] \
#  -H 'content-type: application/json' \
#  -d '{"foo": "bar"}
  
  

#binding.pry

#x= 3
#p stockresponse

