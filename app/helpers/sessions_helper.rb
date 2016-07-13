module SessionsHelper
    def sign_in(user)
		session[:user_id] = user.id
		self.current_user = user
	end

	# setter method
	def current_user=(user)
		@current_user = user
	end

	#getter method
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def signed_in?
		!current_user.nil?
	end

	def sign_out
		session[:user_id] = nil
		self.current_user = nil
	end

	def current_user?(user)
		user == current_user
	end

	def deny_access
		redirect_to users_new_path, :notice => "Please sign in to access this page."
	end

	def is_admin
		if self.current_user.role.name == "Administrator"
			true
		else
			false
		end
	end
end