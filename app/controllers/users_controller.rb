class UsersController < ApplicationController
	def new
		@user=User.new
	end

	def create
		@user=User.new(params[:user])
		if params[:user][:password]==params[:user][:cpassword]
			if @user.save
				redirect_to new_logins_path
			else
				render :new
			end
		else
			flash[:error]="Password mismatched"
			render :new
		end
	end

end
