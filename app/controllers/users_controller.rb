class UsersController < ApplicationController

	skip_filter :authenticate, :only => [:create, :new]

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user, status = User.create_user(params)
		if status
			session[:user_id] = @user.id
			redirect_to root_path, notice: "Successfully signed up."
		else
			flash[:notice] = @user.errors.full_messages
			redirect_to new_user_path
		end
	end

	def show
		respond_to do |format|
			format.js{
				render :partial=>'show.js.erb'
			}
		end
	end
end
