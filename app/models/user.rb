class User < ApplicationRecord
    has_many :quotes
    has_many :books, through: :quotes
    has_many :movies, through: :quotes
    validates :first_name, presence:true
    validates :user_name, presence:true, uniqueness:true
    validates :email, uniqueness:true
    validates :password, presence:true, length: {minimum: 6}
    has_secure_password
end
