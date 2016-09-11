class User < ActiveRecord::Base

	attr_accessor :password
	
	validates_confirmation_of :password
	validates_presence_of :password, :on => :create
	validates_presence_of :email
	validates_uniqueness_of :email
	
	before_save :encrypt_password

	def encrypt_password
		if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
		end
	end

	def authenticate_password(password)
		password_hash == BCrypt::Engine.hash_secret(password, password_salt)
	end

	def self.create_user(params)
		user = User.new(:name => params[:user][:name], :email => params[:user][:email], :password => params[:user][:password])
		status = user.save
		return user, status
	end

	def self.authenticate_user(email, password, options={})
		user = find_by_email(email)
		if user && user.authenticate_password(password)
			user
		else
			nil
		end
	end

	def self.find_by_email(email)
		User.where("email=?",email).last
	end
end
