class Tag < ApplicationRecord
    has_many :quote_tags
    has_many :quotes, through: :quote_tags
    validates :name, presence:true, uniqueness:true
end
