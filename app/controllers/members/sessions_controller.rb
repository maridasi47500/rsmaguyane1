# frozen_string_literal: true

class Members::SessionsController < ApplicationController
  #before_action :configure_sign_in_params, only: [:create]
  protect_from_forgery except: [:create]


  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
   def create
     @member=Member.find_by(login: member_params[:username])
     if @member && @member.valid_password?(member_params[:password])
       bypass_sign_in(@member)
       redirect_to root_path
     else
       redirect_to new_member_session_path, notice: t('messages.erreur.mdp')
     end
   end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected
   def member_params
     params.permit(:username, :email, :password,:secretkey)
   end


  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_in_params
     devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password, :email, :secretkey])
   end
end
