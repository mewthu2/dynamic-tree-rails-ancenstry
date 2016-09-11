class SessionController < ApplicationController
	
	skip_filter :authenticate, :only => [:create, :new]

	def new
		
	end

	def create
		@user = User.authenticate_user(params[:email], params[:password])
		if @user
			session[:user_id] = @user.id
			redirect_to root_path, notice: "Logged in!!"
		else
			redirect_to login_path, notice: "Invalid credentials"
		end
	end

	def destroy
		session[:user_id] = nil
		reset_session
		redirect_to login_path, notice: "Logged out!!"
	end
end
