class User < ActiveRecord::Base
    attr_accessor :password
    
    belongs_to :role
    
    email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    
    validates :name,  :presence 	 => true,
			  :length			  	 => { :maximum => 50 }
	validates :email, :presence 	 => true,
	  		  :format			  	 => { :with => email_regex },
	  		  :uniqueness		  	 => { :case_sensitive => false }

	validates :password, :presence => true,
	  		  :length				 => { :within => 6..40 }
	  
	before_create :encrypting_password
	
	
	def has_password?(submitted_password)
  	  encrypt_password == encrypt(submitted_password)
    end

    def self.authenticate(email, submitted_password)
  	  user = User.find_by(email: email)
  	  return nil if user.nil?
  	  return user if user.has_password?(submitted_password)
    end

    private 
  	  def encrypting_password
  	  	#generate a unique salt if it is a new user
  		self.salt = Digest::SHA2.hexdigest("#{Time.now.utc}--#{password}") if self.new_record?

  		# encrypt the password and store that in the encrypt_password field
  		self.encrypt_password = encrypt(password)
  	  end

  	def encrypt(pass)
  		Digest::SHA2.hexdigest("#{self.salt}--#{pass}")
  	end
end

#16f3e96bd933dbb40be0cf107125a8ac1261ca0336ab704a8cbf31b90146fcbf
#16f3e96bd933dbb40be0cf107125a8ac1261ca0336ab704a8cbf31b90146fcbf

#5cbfd7ce45868ca3abe4f908daa238dcaf9b880a6fa177f9a83286de1d40460c