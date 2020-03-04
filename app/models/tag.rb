class Tag < ApplicationRecord
    has_many :quotetags
    has_many :quotes, through: :quotetags
    validates :name, presence:true, uniqueness:true
end
