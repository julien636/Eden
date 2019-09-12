# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


10.times do 
    Buyer.create(email:Faker::Internet.email, password: Faker::Internet.password)
end

10.times do 
    Farmer.create(phone_number:Faker::PhoneNumber.phone_number, rating_number:0,rating:5,farmer_zipcode:Faker::Address.zip_code,farmer_adress:Faker::Address.street_address, farmer_country:"Sénégal", farmer_city:"Dakar",count:0 )
end

10.times do 
    Product.create(prod_category:"Vegetables", prod_name:Faker::Food.vegetables, prod_subname:"à voir", prod_price:5)
end

10.times do 
    i=rand(1..10)
    Offer.create(offer_quantity:50, date_harvest:DateTime.now,offer_adress:Farmer.find(i).farmer_adress,offer_zipcode:Farmer.find(i).farmer_zipcode,offer_country:Farmer.find(i).farmer_country,product_id:rand(1..10),farmer_id:Farmer.find(i).id,offer_price:rand(5..20),offer_city:"Dakar")
end

10.times do 
    i=rand(1..10)
    Transaction.create(transa_adress:Farmer.find(i).farmer_adress, transa_zipcode:Farmer.find(i).farmer_zipcode, transa_quantity:rand(1..100), buyer_id:rand(1..10), offer_id:rand(1..10),transa_city:"Dakar",transa_confirmation:false)
end




