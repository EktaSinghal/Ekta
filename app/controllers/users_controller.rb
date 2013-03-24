class UsersController < ApplicationController
	def new
		@user=User.new
	end

	def create
		@user=User.new(params[:user])
		if params[:user][:password]==params[:user][:cpassword]
			if @user.save
				flash[:success] = "Sucessfully logged"
				redirect_to new_users_path
			else
				flash.now[:error]=@user.errors.full_messages.join("<br>").html_safe
				render :new
			end
		else
			flash[:error]="Password mismatched"
			render :new
		end
	end

	def login
		if request.post? and params[:user]
    		@user = User.new(params[:user])
 
    		user = User.find_by_username(@user.username)
 
		    # If we found a user with that username and the password provided matches
		    # the password on file for that user, we can login the user.
    		if user and user.password_matches?(@user.password)
      			flash[:notice]="Successfully logged"
    else
      flash[:notice] = "Sorry, no user was found with that username/password combination.";
    end
  end
	end
end
