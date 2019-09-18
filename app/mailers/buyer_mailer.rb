class BuyerMailer < ApplicationMailer
  default from: 'alexis.edenfarm@gmail.com'
  def confirmation_send(buyer,transaction)
        #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
        @buyer = buyer
        @transaction=transaction

        #on définit une variable @url qu'on utilisera dans la view d’e-mail
        @url  = 'http://edenstaging.herokuapp.com/' 
    
        # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
        mail(to: @buyer.email, subject: 'Confirmation de votre commande') 
  end
end