class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    edit_buyer_path(current_buyer.id)
  end
end