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

    if count == 4
     fifth_message
    end

    if count == 5
      sixth_message
    end

    if count == 6
      seventh_message
    end

  end

  def confirm
    buyer_number = params["From"]
    message_body = params["Body"]
    transaction = Transaction.find(message_body.to_i)
    farmer = transaction.offer.farmer
    farmer_number = transaction.offer.farmer.phone_number
    code = rand(10000..99999)
    transaction.confirmation_code = code
    transaction.save

    boot_twilio
    @client.messages.create ({
      from: Rails.application.credentials.twilio_number2,
      to: buyer_number,
      body: "Bonjour, pour confirmer la transaction veuillez transmettre le code #{code} à l'acheteur"
    })
    @client.messages.create ({
      from: Rails.application.credentials.twilio_number,
      to: farmer_number,
      body: "Veuillez entrer le n° de transaction suivi du code de l'acheteur à 5 chiffres pour confirmer la transaction. Ex: #{transaction.id},23345"
    })
    farmer.count = 5
    farmer.save
  end

  def is_registered
    a = 0
    user_number = params['From']
    users = Farmer.all
    users.each {|x| if x.phone_number == user_number then a = 1 end } 
    return a 
  end

  def new_user
    message = "Bienvenue sur Eden. Pour valider l'inscription, merci d'indiquer votre adresse, votre ville et le code postal dans le même message espacés par des ##  Ex: 5 villa Haussmann#92130#Paris" 

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
        body: "Quel fruit/légume/céréale souhaitez-vous vendre ? Veuillez indiquer la variété du produit. Ex: 'Riz Sahel 202'"
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
        body: "Adresse enregistrée ! Quel fruit/légume/céréale souhaitez-vous vendre ? Veuillez indiquer la variété du produit. Ex: 'Riz Sahel 202'"
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

    newproduct = Product.find_by(prod_subname: message_body)
    new_offer.product = newproduct
    new_offer.save

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

  def fifth_message
    message_body = params["Body"]
    from_number = params["From"]
    transa = Transaction.find(message_body[1..-1])
    farmer = Farmer.find_by(phone_number: from_number)
    if message_body.downcase.include?("y"&&"#{transa.id}")
      boot_twilio
      @client.messages.create ({
        from: Rails.application.credentials.twilio_number,
        to: from_number,
        body: "L'offre d'achat a bien été acceptée, l'acheteur va prendre contact avec vous pour les modalités de rendez-vous. Ecrire Allo pour ajouter une nouvelle offre"
      })
      transa.transa_confirmation = true
      transa.save
      farmer.count = 0
      farmer.save
      BuyerMailer.confirmation_send(transa.buyer,transa).deliver_now
    elsif message_body.downcase.include?("n"&&"#{transa.id}")
      boot_twilio
      @client.messages.create ({
        from: Rails.application.credentials.twilio_number,
        to: from_number,
        body: "L'offre d'achat a été déclinée. Ecrire Allo pour ajouter une nouvelle offre"
      })
      transa.transa_confirmation = false
      transa.save
      farmer.count = 0
      farmer.save
    else 
      boot_twilio
      @client.messages.create ({
        from: Rails.application.credentials.twilio_number,
        to: from_number,
        body: "Nous n'avons pas bien compris, veuillez vous référer au message précédent"
      })
    end
  end

  def sixth_message
    message_body = params["Body"]
    from_number = params["From"]
    farmer = Farmer.find_by(phone_number: from_number)
    transaction = Transaction.find(message_body.split(",")[0].to_i)
    buyer = transaction.buyer
    if transaction.confirmation_code.to_i == message_body.split(",")[1].to_i
      #### lancer le paiment du farmer via sms
      boot_twilio
      @client.messages.create ({
        from: Rails.application.credentials.twilio_number,
        to: from_number,
        body: "Code de confirmation correct, vous allez recevoir le paiment très bientôt. Veuillez attribuer une note entre 1 et 5 pour l'acheteur n°#{buyer.id}. Ex: #{buyer.id},4"
      })
      farmer.count = 6
      farmer.save
    else 
      boot_twilio
      @client.messages.create ({
        from: Rails.application.credentials.twilio_number,
        to: from_number,
        body: "Code de confirmation incorrect, veuillez réessayer:"
      })
      farmer.count = 5
      farmer.save
    end

    def seventh_message
      from_number = params["From"]
      message_body = params["Body"]
      farmer = Farmer.find_by(phone_number: from_number)
      buyer = Buyer.find(message_body.split(",")[0].to_i)
      buyer.buyer_rating = message_body.split(",")[1].to_i
      buyer.buyer_rating_number = buyer.buyer_rating_number.to_i + 1
      buyer.save
      boot_twilio
      @client.messages.create ({
        from: Rails.application.credentials.twilio_number,
        to: from_number,
        body: "Note enregistrée, pour publier une nouvelle offre veuillez écrire allo"
      })
      farmer.count = 0
      farmer.save
    end
    
  end
  private
 
  def boot_twilio
    account_sid = Rails.application.credentials.twilio_sid
    auth_token = Rails.application.credentials.twilio_token
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
end
