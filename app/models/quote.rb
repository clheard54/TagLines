class Quote < ApplicationRecord
    has_many :quotetags
    has_many :tags, through: :quotetags
    belongs_to :user
    belongs_to :book, optional: true
    belongs_to :movie, optional:true
    validates :quote, presence:true
    accepts_nested_attributes_for :book
    accepts_nested_attributes_for :movie
    accepts_nested_attributes_for :tags

    def books_attributes=(books_attributes)
        books_attributes.values.each do |book_attributes|
            self.build_book(book_attributes)
        end
    end

    def movies_attributes=(movies_attributes)
        movies_attributes.values.each do |movie_attributes|
            self.build_movie(movie_attributes)
        end
    end

    def tags_attributes=(tags_attributes)
        tags_attributes.values.each do |tag_attributes|
            self.tags.build(tag_attributes)
        end
    end
end
