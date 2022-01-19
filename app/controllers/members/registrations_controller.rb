class Members::RegistrationsController < ApplicationController
  #before_action :configure_sign_up_params, only: [:create]
  #before_action :configure_account_update_params, only: [:update]
  protect_from_forgery except: [:create,:new]

  # GET /resource/sign_up
  def new
    
  end

  # POST /resource
  def create
    @member=Member.new(member_params) 
        if @member.save
bypass_sign_in(@member)
 redirect_to root_path, notice: 'Connecté(e).'
      else
render :new
      end

  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

   protected

   #If you have extra params to permit, append them to the sanitizer.
   def member_params
     params.permit(:username, :email, :password,:secretkey)
   end
   def configure_sign_up_params
     devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password,:secretkey])
   end

   #If you have extra params to permit, append them to the sanitizer.
   def configure_account_update_params
     devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
   end

   #The path used after sign up.
   def after_sign_up_path_for(resource)
     super(resource)
   end

   #The path used after sign up for inactive accounts.
   def after_inactive_sign_up_path_for(resource)
     super(resource)
   end
end
