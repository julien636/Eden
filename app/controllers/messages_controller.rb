require 'time'
class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def start
    #If the number which is sending a sms is not in the database, an sms is sent to create an account
    a = is_registered
    if a == 0
      new_user
    end

    from_number = params["From"]
    farmer = Farmer.find_by(phone_number: from_number)
    #Confirmation of the account with all information
    if a == 1 && farmer.farmer_adress.nil? == true
      confirmation_user
    end
    ####

    message_body = params["Body"]
    count = farmer.count
    if message_body.downcase.include?("allo") && a == 1
      first_message
    end
    if count == 1
      second_message
    end

    if count == 2
      third_message
    end

    if count == 3
     fourth_message
    end

  end

  def is_registered
    a = 0
    user_number = params['From']
    users = Farmer.all
    users.each {|x| if x.phone_number == user_number then a = 1 end } 
    return a 
  end

  def new_user
    message = "Bienvenue sur Eden. Pour valider l'inscription, merci d'indiquer votre adresse, votre ville et le code postal dans le même message espacés par des #. Ex: 5 villa Haussmann#92130#Paris" 

    #Twilio send message
    from_number = params["From"]
    message_body = params["Body"]
    from_country = params["FromCountry"] 
    boot_twilio
    @client.messages.create ({
      from: Rails.application.credentials.twilio_number,
      to: from_number,
      body: message
    })
    #########

    Farmer.create(phone_number: from_number, farmer_country: from_country, count: 0)
  end

  def confirmation_user
    message = "Merci de votre inscription ! Pour enregistrer une commande à tout moment veuillez envoyer : Allo"

    #Twilio send message
    from_number = params["From"]
    message_body = params["Body"]
    from_country = params["FromCountry"] 
    boot_twilio
    @client.messages.create ({
      from: Rails.application.credentials.twilio_number,
      to: from_number,
      body: message
    })
    ######

    #Update farmer's data with previous sms
    farmer = Farmer.find_by(phone_number: from_number)
    farmer.farmer_adress = message_body.split("#")[0]
    farmer.farmer_zipcode = message_body.split("#")[1]
    farmer.farmer_city = message_body.split("#")[2]
    farmer.save
    #####
  end

  def first_message
    from_number = params["From"]
    farmer = Farmer.find_by(phone_number: from_number)
    farmer.count = 1
    farmer.save

    boot_twilio
    @client.messages.create ({
      from: Rails.application.credentials.twilio_number,
      to: from_number,
      body: "Bonjour, vous êtes sur le point de publier une offre sur Eden. Pour la collecte, désirez-vous l'adresse suivante: #{farmer.farmer_adress}##{farmer.farmer_zipcode}##{farmer.farmer_city}##{farmer.farmer_country} ? Entrez Y ou une nouvelle adresse avec le même format. "
    })
  end

  def second_message
    message_body = params["Body"]
    from_number = params["From"]
    farmer = Farmer.find_by(phone_number: from_number)
    if message_body.downcase == "y"
      boot_twilio
      @client.messages.create ({
        from: Rails.application.credentials.twilio_number,
        to: from_number,
        body: "Quel fruit/légume/céréale souhaitez-vous vendre ? Veuillez indiquer la variété du produit. Ex: 'Tomate Cerise'"
      })
      farmer.count = 2
      farmer.save
      new_offer = Offer.create(offer_adress: "#{farmer.farmer_adress}", offer_zipcode: "#{farmer.farmer_zipcode}", offer_country: "#{farmer.farmer_country}", offer_city: "#{farmer.farmer_city}")
      new_offer.farmer_id = farmer.id
      new_offer.save
    else
      boot_twilio
      @client.messages.create ({
        from: Rails.application.credentials.twilio_number,
        to: from_number,
        body: "Adresse enregistrée ! Quel fruit/légume/céréale souhaitez-vous vendre ? Veuillez indiquer la variété du produit. Ex: 'Tomate Cerise'"
      })
      farmer.count = 2
      farmer.save


      new_offer = Offer.new
      new_offer.offer_adress = message_body.split("#")[0]
      new_offer.offer_zipcode = message_body.split("#")[1]
      new_offer.offer_city = message_body.split("#")[2]
      new_offer.offer_country = message_body.split("#")[3]
      new_offer.farmer_id = farmer.id
      new_offer.save
    end
  end

  def third_message
    message_body = params["Body"].upcase
    from_number = params["From"]
    farmer = Farmer.find_by(phone_number: from_number)
    new_offer = farmer.offers.last
    farmer.count = 3
    farmer.save

    ########When product db is full
    #product = Product.find_by(prod_subname: message_body)
    #new_offer.product_id = product.id
    #new_offer.save

    boot_twilio
    @client.messages.create ({
      from: Rails.application.credentials.twilio_number,
      to: from_number,
      body: "Veuillez indiquer dans l'ordre suivant la quantité(kg), le prix par kilo et la date de récolte. Ex: pour 1200kg de  à un prix de 15 FCFA le kilo récolté le 8 Septembre 2019 => 1200,15,8/09/2019"
    })
  end


  def fourth_message
    message_body = params["Body"]
    from_number = params["From"]
    farmer = Farmer.find_by(phone_number: from_number)
    offer = farmer.offers.last
    offer.offer_quantity = message_body.split(",")[0]
    offer.offer_price = message_body.split(",")[1]
    offer.date_harvest = Time.parse(message_body.split(",")[2])
    offer.save
  
    boot_twilio
    @client.messages.create ({
      from: Rails.application.credentials.twilio_number,
      to: from_number,
      body: "Votre offre a bien été enregistrée, un acheteur va entrer en contact avec vous dans les prochains jours, pour publier une nouvelle offre, veuillez écrire 'Allo'"
    })
    farmer.count = 0
    farmer.save
  end



  private
 
  def boot_twilio
    account_sid = Rails.application.credentials.twilio_sid
    auth_token = Rails.application.credentials.twilio_token
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
end
