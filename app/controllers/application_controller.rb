class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth, if: :production?
  before_action :call_category
  before_action :request_path
  protect_from_forgery with: :exception

  private
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
      keys: [:nickname, :family_name, :first_name, :family_name_katakana, :first_name_katakana, :birthday_year, :birthday_month, :birthday_date, :image, :profile, :provider, :uid,
            address_attributes: [:family_name, :first_name, :family_name_katakana, :first_name_katakana, :postal_code, :prefecture_id, :city, :block_number, :building, :phone_number]])
  end

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def request_path
    @path = controller_path + '#' + action_name
    def @path.is(*str)
        str.map{|s| self.include?(s)}.include?(true)
    end
  end

  def call_category
    @grandparents = Category.roots
  end
end
