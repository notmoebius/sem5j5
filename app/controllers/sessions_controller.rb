require 'bcrypt'
class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # cherche s'il existe un utilisateur en base avec l’e-mail
    user = User.find_by(email: params[:email])
    puts "*" * 60
    puts user.inspect
    puts "*" * 60

    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      puts "Login is OK!"
      redirect_to '/'
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    #session[:user_id] = nil
    puts "#{:user_id}, vous êtes déconnecté"
    redirect_to '/'  # render :new   ??? a tester
  end
end
