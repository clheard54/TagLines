class Book < ApplicationRecord
    validates :title, presence:true, uniqueness:true
    validates :author, presence:true
    accepts_nested_attributes_for :quotes

    def quotes_attributes=(quotes_attributes)
        quotes_attributes.values.each do |quote_attributes|
            self.quotes.build(quote_attributes)
        end
    end
end
