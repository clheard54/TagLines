class Movie < ApplicationRecord
    has_many :quotes
    has_many :users, through: :quotes
    validates :title, presence:true, uniqueness:true
    accepts_nested_attributes_for :quotes

    def quotes_attributes=(quotes_attributes)
        quotes_attributes.values.each do |quote_attributes|
            self.quotes.build(quote_attributes)
        end
    end
end
