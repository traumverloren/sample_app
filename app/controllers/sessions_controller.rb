class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
      flash[:notice] = "Welcome!"
    else
      flash.now[:danger] = "Sorry, please try again."
      render 'new'
    end
  end

  def destroy
    redirect_to root_path
  end

end
