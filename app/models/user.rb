class User < ActiveRecord::Base
    
    has_secure_password
    has_many :messages
    has_many :user_books

end
