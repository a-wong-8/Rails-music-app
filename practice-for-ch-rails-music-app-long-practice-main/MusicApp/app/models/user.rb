class User < ApplicationRecord
    
    before_validation :ensure_session_token

    def generate_unique_session_token

    end

    def self.find_by_credentials(email, password)
        email = Email.find_by(email: email)
        if email && email.is_valid_password?(password)
            email 
        else 
            nil 
        end
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::password.create(password)
    end

    def is_valid_password?(password)
        pass_obj = BCrypt::Password.new(self.password_digest)
        pass_obj.is_password?(password)
    end

    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
        self.save!
        self.session_token
    end

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end
end
