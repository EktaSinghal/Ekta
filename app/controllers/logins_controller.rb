class LoginsController < ApplicationController
  def new
    @user=User.new
  end

  def create
    user=User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      redirect_to new_homes_path
      else 
        flash[:error] = "Username or password was invalid."
        render :new
    end
  end
end