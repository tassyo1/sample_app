class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
     log_in user     
     #guarda o remember token e o user id ambos criptografados em cookies:w
     params[:session][:remember_me] == '1' ?  remember(user) : forget(user)
     redirect_to user  
    else
      #Create a new error message.
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
   end

  def destroy
    log_out if logged_in? #caso o usuário tenha duas telas abertas e deslogar em uma
    redirect_to root_url
  end
end
