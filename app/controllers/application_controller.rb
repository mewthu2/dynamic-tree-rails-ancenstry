class ApplicationController < ActionController::Base
  
	layout "application"

	protect_from_forgery with: :exception

	helper_method :current_user

	before_action :authenticate

	def authenticate
		if current_user.nil?
			redirect_to_login
		end
	end

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def redirect_to_login
	    if request.xhr?
	      render js: "window.location.reload();"
	    else
	       redirect_to login_path   
	    end
	end 

	
	def default_paginate_options
		{:per_page => 10, :page => params[:page] || 1}
	end

end
