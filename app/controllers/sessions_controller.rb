class SessionsController < ApplicationController

  def new
  end

  def create
    # binding.pry
    @user = User.find_by(name: params[:user][:name])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
