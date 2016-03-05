class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
   # debugger (comando da gem byebug)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Mostra mensagem de sucesso
    else
      render 'new'
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
