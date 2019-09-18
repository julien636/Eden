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

# 10.times do 
#     Product.create(prod_category:"Vegetables", prod_name:Faker::Food.vegetables, prod_subname:"à voir", prod_price:5)
# end

##DB produits Sénégal
Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ IRAT 10");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ DJ 8-341");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ ITA 150");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ WAB 56-50");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ NERICA-1");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ NERICA-5");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ NERICA-6");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ DJ 684-D");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ DJ 11-509");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ DJ 12-519");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ BW 248-1");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ BR 51-46-5");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ ITA 123");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ TOX 728-1");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ BG 90-2");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ ROK 5");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ WAR 1");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ WAR 77-3-2-2");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ WAR 81-2-1-3-2");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ IKONG PAO");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ IR 8");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ JAYA");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ IR 1529-680-3");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ IR 442");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ KH 998");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ KWAN SHE SHUNG");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ SAHEL 108");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ SAHEL 201");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ SAHEL 202");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ SAHEL 134");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ SAHEL 159");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ SAHEL 208");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ SAHEL 209");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ SAHEL 210");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ SAHEL 177");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ SAHEL 217");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ SAHEL 222");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ SAHEL 305");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ SAHEL 317");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ SAHEL 328");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ SAHEL 329");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ NERICA-S-19");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ NERICA-S-21");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ NERICA-S-36");Product.create(prod_category:"CEREALE",prod_name:"RIZ",prod_subname:"RIZ NERICA-S-44");Product.create(prod_category:"CEREALE",prod_name:"SORGHO",prod_subname:"SORGHO CE 145-66");Product.create(prod_category:"CEREALE",prod_name:"SORGHO",prod_subname:"SORGHO CE 151-262");Product.create(prod_category:"CEREALE",prod_name:"SORGHO",prod_subname:"SORGHO CE 180-33");Product.create(prod_category:"CEREALE",prod_name:"SORGHO",prod_subname:"SORGHO CE 196-7-2-1");Product.create(prod_category:"CEREALE",prod_name:"SORGHO",prod_subname:"SORGHO F2-20");Product.create(prod_category:"CEREALE",prod_name:"SORGHO",prod_subname:"SORGHO FAOUROU");Product.create(prod_category:"CEREALE",prod_name:"SORGHO",prod_subname:"SORGHO NGUINTHE");Product.create(prod_category:"CEREALE",prod_name:"SORGHO",prod_subname:"SORGHO NGANDA");Product.create(prod_category:"CEREALE",prod_name:"SORGHO",prod_subname:"SORGHO DAROU");Product.create(prod_category:"CEREALE",prod_name:"MIL",prod_subname:"MIL SOUNA 3");Product.create(prod_category:"CEREALE",prod_name:"MIL",prod_subname:"MIL IBV 8001");Product.create(prod_category:"CEREALE",prod_name:"MIL",prod_subname:"MIL IBV 8004");Product.create(prod_category:"CEREALE",prod_name:"MIL",prod_subname:"MIL IBMV 8402");Product.create(prod_category:"CEREALE",prod_name:"MIL",prod_subname:"MIL ISMI 9507");Product.create(prod_category:"CEREALE",prod_name:"MIL",prod_subname:"MIL GAWANE");Product.create(prod_category:"CEREALE",prod_name:"MIL",prod_subname:"MIL THIALACK 2");Product.create(prod_category:"CEREALE",prod_name:"MAIS",prod_subname:"MAIS XEEWEL GI");Product.create(prod_category:"CEREALE",prod_name:"MAIS",prod_subname:"MAIS NOOR 96");Product.create(prod_category:"CEREALE",prod_name:"MAIS",prod_subname:"MAIS DOO MER");Product.create(prod_category:"CEREALE",prod_name:"MAIS",prod_subname:"MAIS SOOROR");Product.create(prod_category:"CEREALE",prod_name:"MAIS",prod_subname:"MAIS GAAW NA");Product.create(prod_category:"CEREALE",prod_name:"MAIS",prod_subname:"MAIS JABOOT");Product.create(prod_category:"CEREALE",prod_name:"MAIS",prod_subname:"MAIS GOOR YOMBOUL");Product.create(prod_category:"CEREALE",prod_name:"MAIS",prod_subname:"MAIS YAAYI SEEX");Product.create(prod_category:"LEGUMINEUSE",prod_name:"ARACHIDE",prod_subname:"ARACHIDE 28-206");Product.create(prod_category:"LEGUMINEUSE",prod_name:"ARACHIDE",prod_subname:"ARACHIDE 756-A");Product.create(prod_category:"LEGUMINEUSE",prod_name:"ARACHIDE",prod_subname:"ARACHIDE 55-437");Product.create(prod_category:"LEGUMINEUSE",prod_name:"ARACHIDE",prod_subname:"ARACHIDE 57-313");Product.create(prod_category:"LEGUMINEUSE",prod_name:"ARACHIDE",prod_subname:"ARACHIDE 57-422");Product.create(prod_category:"LEGUMINEUSE",prod_name:"ARACHIDE",prod_subname:"ARACHIDE 69-101");Product.create(prod_category:"LEGUMINEUSE",prod_name:"ARACHIDE",prod_subname:"ARACHIDE 73-27");Product.create(prod_category:"LEGUMINEUSE",prod_name:"ARACHIDE",prod_subname:"ARACHIDE 73-28");Product.create(prod_category:"LEGUMINEUSE",prod_name:"ARACHIDE",prod_subname:"ARACHIDE 73-30");Product.create(prod_category:"LEGUMINEUSE",prod_name:"ARACHIDE",prod_subname:"ARACHIDE 73-33");Product.create(prod_category:"LEGUMINEUSE",prod_name:"ARACHIDE",prod_subname:"ARACHIDE GC 8-35");Product.create(prod_category:"LEGUMINEUSE",prod_name:"ARACHIDE",prod_subname:"ARACHIDE FLEUR 11");Product.create(prod_category:"LEGUMINEUSE",prod_name:"ARACHIDE",prod_subname:"ARACHIDE 78-937");Product.create(prod_category:"LEGUMINEUSE",prod_name:"ARACHIDE",prod_subname:"ARACHIDE 55-33");Product.create(prod_category:"LEGUMINEUSE",prod_name:"ARACHIDE",prod_subname:"ARACHIDE SRV 1-19");Product.create(prod_category:"LEGUMINEUSE",prod_name:"ARACHIDE",prod_subname:"ARACHIDE 73-9-11");Product.create(prod_category:"LEGUMINEUSE",prod_name:"ARACHIDE",prod_subname:"ARACHIDE GH 119-20");Product.create(prod_category:"LEGUMINEUSE",prod_name:"ARACHIDE",prod_subname:"ARACHIDE PC 79-79");Product.create(prod_category:"LEGUMINEUSE",prod_name:"ARACHIDE",prod_subname:"ARACHIDE H 75-0");Product.create(prod_category:"LEGUMINEUSE",prod_name:"NIEBE",prod_subname:"NIEBE 58-57");Product.create(prod_category:"LEGUMINEUSE",prod_name:"NIEBE",prod_subname:"NIEBE NDIAMBOUR");Product.create(prod_category:"LEGUMINEUSE",prod_name:"NIEBE",prod_subname:"NIEBE MOUGNE");Product.create(prod_category:"LEGUMINEUSE",prod_name:"NIEBE",prod_subname:"NIEBE BAMBEY 21");Product.create(prod_category:"LEGUMINEUSE",prod_name:"NIEBE",prod_subname:"NIEBE TN 88-63");Product.create(prod_category:"LEGUMINEUSE",prod_name:"NIEBE",prod_subname:"NIEBE C.B-5");Product.create(prod_category:"LEGUMINEUSE",prod_name:"NIEBE",prod_subname:"NIEBE DIONGAMA");Product.create(prod_category:"LEGUMINEUSE",prod_name:"NIEBE",prod_subname:"NIEBE MELAKH");Product.create(prod_category:"LEGUMINEUSE",prod_name:"NIEBE",prod_subname:"NIEBE MOURIDE");Product.create(prod_category:"LEGUMINEUSE",prod_name:"NIEBE",prod_subname:"NIEBE YACINE");Product.create(prod_category:"LEGUMINEUSE",prod_name:"NIEBE",prod_subname:"NIEBE PAKAU");Product.create(prod_category:"LEGUMINEUSE",prod_name:"NIEBE",prod_subname:"NIEBE 58-74 F");Product.create(prod_category:"LEGUMINEUSE",prod_name:"NIEBE",prod_subname:"NIEBE 66-35 F");Product.create(prod_category:"LEGUME",prod_name:"OIGNON",prod_subname:"OIGNON NOFLAYE");Product.create(prod_category:"LEGUME",prod_name:"OIGNON",prod_subname:"OIGNON GANDIOL");Product.create(prod_category:"LEGUME",prod_name:"OIGNON",prod_subname:"OIGNON GAO");Product.create(prod_category:"LEGUME",prod_name:"OIGNON",prod_subname:"OIGNON SOLARA");Product.create(prod_category:"LEGUME",prod_name:"OIGNON",prod_subname:"OIGNON SIROCCO");Product.create(prod_category:"LEGUME",prod_name:"OIGNON",prod_subname:"OIGNON JULIO");Product.create(prod_category:"LEGUME",prod_name:"OIGNON",prod_subname:"OIGNON DAMANI");Product.create(prod_category:"LEGUME",prod_name:"OIGNON",prod_subname:"OIGNON BELAMI");Product.create(prod_category:"LEGUME",prod_name:"OIGNON",prod_subname:"OIGNON ALIZE");Product.create(prod_category:"LEGUME",prod_name:"TOMATE",prod_subname:"TOMATE XINA PF");Product.create(prod_category:"LEGUME",prod_name:"TOMATE",prod_subname:"TOMATE XINA GF");Product.create(prod_category:"LEGUME",prod_name:"TOMATE",prod_subname:"TOMATE F1 GANILA");Product.create(prod_category:"LEGUME",prod_name:"TOMATE",prod_subname:"TOMATE F1 JAGUAR");Product.create(prod_category:"LEGUME",prod_name:"TOMATE",prod_subname:"TOMATE F1 NADIRA");Product.create(prod_category:"LEGUME",prod_name:"TOMATE",prod_subname:"TOMATE F1 NINJA");Product.create(prod_category:"LEGUME",prod_name:"TOMATE",prod_subname:"TOMATE F1 SUMO");Product.create(prod_category:"LEGUME",prod_name:"TOMATE",prod_subname:"TOMATE F1 THORGAL");Product.create(prod_category:"LEGUME",prod_name:"TOMATE",prod_subname:"TOMATE F1 XEWEL");Product.create(prod_category:"LEGUME",prod_name:"TOMATE",prod_subname:"TOMATE F1 LINDO");Product.create(prod_category:"LEGUME",prod_name:"TOMATE",prod_subname:"TOMATE F1 MONGAL");Product.create(prod_category:"LEGUME",prod_name:"PIMENT",prod_subname:"PIMENT MALIKA");Product.create(prod_category:"LEGUME",prod_name:"PIMENT",prod_subname:"PIMENT SALMONE");Product.create(prod_category:"LEGUME",prod_name:"PIMENT",prod_subname:"PIMENT SAFI");Product.create(prod_category:"LEGUME",prod_name:"PIMENT",prod_subname:"PIMENT JAUNE DU BURKINA");Product.create(prod_category:"LEGUME",prod_name:"PIMENT",prod_subname:"PIMENT BIG SUN");Product.create(prod_category:"LEGUME",prod_name:"PIMENT",prod_subname:"PIMENT BOMBARDIER");Product.create(prod_category:"LEGUME",prod_name:"PIMENT",prod_subname:"PIMENT SHERIF");Product.create(prod_category:"LEGUME",prod_name:"PIMENT",prod_subname:"PIMENT F1 AVENIR");Product.create(prod_category:"LEGUME",prod_name:"PIMENT",prod_subname:"PIMENT F1 FOREVER");Product.create(prod_category:"LEGUME",prod_name:"PIMENT",prod_subname:"PIMENT F1 SUNNY");Product.create(prod_category:"LEGUME",prod_name:"JAXATU",prod_subname:"JAXATU KABROUSSE");Product.create(prod_category:"LEGUME",prod_name:"JAXATU",prod_subname:"JAXATU L-10");Product.create(prod_category:"LEGUME",prod_name:"JAXATU",prod_subname:"JAXATU L-18");Product.create(prod_category:"LEGUME",prod_name:"JAXATU",prod_subname:"JAXATU SOXNA");Product.create(prod_category:"LEGUME",prod_name:"JAXATU",prod_subname:"JAXATU NGOYO");Product.create(prod_category:"LEGUME",prod_name:"JAXATU",prod_subname:"JAXATU KEUR MBIR N.");Product.create(prod_category:"LEGUME",prod_name:"JAXATU",prod_subname:"JAXATU NGALAM");Product.create(prod_category:"LEGUME",prod_name:"JAXATU",prod_subname:"JAXATU NDROWA");Product.create(prod_category:"LEGUME",prod_name:"JAXATU",prod_subname:"JAXATU SOXNA PLUS");Product.create(prod_category:"LEGUME",prod_name:"JAXATU",prod_subname:"JAXATU NGALAM PLUS");Product.create(prod_category:"LEGUME",prod_name:"JAXATU",prod_subname:"JAXATU KOTOBI");Product.create(prod_category:"LEGUME",prod_name:"JAXATU",prod_subname:"JAXATU MEKETAN");Product.create(prod_category:"LEGUME",prod_name:"JAXATU",prod_subname:"JAXATU DJAMBA");Product.create(prod_category:"LEGUME",prod_name:"POMME DE TERRE",prod_subname:"POMME DE TERRE SPUNTA");Product.create(prod_category:"LEGUME",prod_name:"POMME DE TERRE",prod_subname:"POMME DE TERRE CLAUSTAR");Product.create(prod_category:"LEGUME",prod_name:"POMME DE TERRE",prod_subname:"POMME DE TERRE ATLAS");Product.create(prod_category:"LEGUME",prod_name:"POMME DE TERRE",prod_subname:"POMME DE TERRE SAHEL");Product.create(prod_category:"LEGUME",prod_name:"POMME DE TERRE",prod_subname:"POMME DE TERRE AIDA");Product.create(prod_category:"LEGUME",prod_name:"PATATE DOUCE",prod_subname:"PATATE DOUCE NDARGU");Product.create(prod_category:"LEGUME",prod_name:"PATATE DOUCE",prod_subname:"PATATE DOUCE FANAYE");Product.create(prod_category:"LEGUME",prod_name:"PATATE DOUCE",prod_subname:"PATATE DOUCE CIAM");Product.create(prod_category:"LEGUME",prod_name:"PATATE DOUCE",prod_subname:"PATATE DOUCE CLONE 2");Product.create(prod_category:"LEGUME",prod_name:"PATATE DOUCE",prod_subname:"PATATE DOUCE CLONE 29");Product.create(prod_category:"LEGUME",prod_name:"PATATE DOUCE",prod_subname:"PATATE DOUCE 2532 TIS");Product.create(prod_category:"LEGUME",prod_name:"PATATE DOUCE",prod_subname:"PATATE DOUCE 2544");Product.create(prod_category:"LEGUME",prod_name:"PATATE DOUCE",prod_subname:"PATATE DOUCE 83-176 TIS");Product.create(prod_category:"LEGUME",prod_name:"PATATE DOUCE",prod_subname:"PATATE DOUCE WALO");Product.create(prod_category:"LEGUME",prod_name:"GOMBO",prod_subname:"GOMBO CLEMSON SPINLESS");Product.create(prod_category:"LEGUME",prod_name:"GOMBO",prod_subname:"GOMBO PUSO");Product.create(prod_category:"LEGUME",prod_name:"GOMBO",prod_subname:"GOMBO POP 12");Product.create(prod_category:"LEGUME",prod_name:"GOMBO",prod_subname:"GOMBO RED ROCKET");Product.create(prod_category:"LEGUME",prod_name:"GOMBO",prod_subname:"GOMBO PAYSAN");Product.create(prod_category:"LEGUME",prod_name:"GOMBO",prod_subname:"GOMBO HIRE");Product.create(prod_category:"LEGUME",prod_name:"GOMBO",prod_subname:"GOMBO INDIANA");Product.create(prod_category:"LEGUME",prod_name:"GOMBO",prod_subname:"GOMBO EMERALD");Product.create(prod_category:"LEGUME",prod_name:"GOMBO",prod_subname:"GOMBO ESSOUMTEM");Product.create(prod_category:"LEGUME",prod_name:"GOMBO",prod_subname:"GOMBO F1 VOLTA");Product.create(prod_category:"LEGUME",prod_name:"GOMBO",prod_subname:"GOMBO F1 MADISON");Product.create(prod_category:"LEGUME",prod_name:"GOMBO",prod_subname:"GOMBO F1 LIMA");Product.create(prod_category:"LEGUME",prod_name:"GOMBO",prod_subname:"GOMBO F1 KIRENE");Product.create(prod_category:"LEGUME",prod_name:"GOMBO",prod_subname:"GOMBO F1 SAHARI");Product.create(prod_category:"LEGUME",prod_name:"AUBERGINE",prod_subname:"AUBERGINE F1 AFRICAN BEAUTY");Product.create(prod_category:"LEGUME",prod_name:"AUBERGINE",prod_subname:"AUBERGINE F1 KALENDA")
#####################
10.times do 
    i=rand(1..10)
    Offer.create(offer_quantity:50, date_harvest:DateTime.now,offer_adress:Farmer.find(i).farmer_adress,offer_zipcode:Farmer.find(i).farmer_zipcode,offer_country:Farmer.find(i).farmer_country,product_id:rand(1..10),farmer_id:Farmer.find(i).id,offer_price:rand(5..20),offer_city:"Dakar")
end

10.times do 
    i=rand(1..10)
    Transaction.create(transa_adress:Farmer.find(i).farmer_adress, transa_zipcode:Farmer.find(i).farmer_zipcode, transa_quantity:rand(1..100), buyer_id:rand(1..10), offer_id:rand(1..10),transa_city:"Dakar",transa_confirmation:false,payment_confirmation:false)
end




