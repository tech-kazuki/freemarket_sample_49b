class Users::RegistrationsController < Devise::RegistrationsController
  before_action :check_captcha, only: [:create]

  def index
  end

  def complete
  end

  def new
    unless session["devise.facebook_data"].nil?
      information = session["devise.facebook_data"]
      @name = information["info"]["name"]
      @email = information["info"]["email"]
      @password = information["password"]
      @provider = information["provider"]
      @uid = information["uid"]
    end
    super
  end
  
  def create
    super
  end

  protected
  
  def check_captcha
    self.resource = resource_class.new sign_up_params
    resource.validate
    unless verify_recaptcha(model: resource)
      respond_with_navigational(resource) { render :new }
    end
  end
  
  def after_sign_up_path_for(resource)
    new_user_card_path(current_user)
  end

  def after_inactive_sign_up_path_for(resource)
    new_user_card_path(current_user)
  end

end
