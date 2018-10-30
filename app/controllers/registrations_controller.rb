class RegistrationsController < Devise::RegistrationsController
  def after_sign_up_for(user)
    preferences_path
  end
end
