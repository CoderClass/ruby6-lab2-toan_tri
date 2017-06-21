class SessionsController < ApplicationController
  def new
  end

  def create
    if @user = User.find_by(email: session_params[:email])
      if @user.authenticate(session_params[:password])
        flash[:success] = "you have been logged in"
        session[:user_id] = @user.id
        redirect_to users_path
      else
        flash[:error] = "Invalid email or password"
        redirect_to login_path
      end
    else
      flash[:error] = "No User found"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private
   def session_params
    params.permit(:email, :password)
   end
end
