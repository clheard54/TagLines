class User < ApplicationRecord
    validates :first_name, presence:true
    validates :user_name, presence:true, uniqueness:true
    validates :email, uniqueness:true
    validates :password, presence:true, length: {minimum: 6}
    # has_secure_password
end
