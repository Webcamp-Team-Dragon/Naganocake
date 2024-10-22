# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_customer, only: [:create]

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    about_path
  end
  
  def reject_customer
   @customer = Customer.find_by(email: params[:customer][:email])
    if @customer
     if @customer.valid_password?(params[:customer][:password]) && (@customer.active_for_authentication? == true)
     else
      flash[:error] = "退会済みです。再度新規登録をしてご利用ください。"
      redirect_to new_customer_registration_path
     end
    else
      flash[:error] = "該当するユーザーが見つかりません。"
    end
  end
  

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
