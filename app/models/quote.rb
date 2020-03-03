class Quote < ApplicationRecord
    validates :quote, presence:true
    accepts_nested_attributes_for :books
    accepts_nested_attributes_for :movies
    accepts_nested_attributes_for :tags

    def books_attributes=(books_attributes)
        books_attributes.values.each do |book_attributes|
            self.build_book(book_attributes)
        end
    end

    def movies_attributes=(movies_attributes)
        movies_attributes.values.each do |movie_attributes|
            self.movies.build(movie_attributes)
        end
    end

    def tags_attributes=(tags_attributes)
        tags_attributes.values.each do |tag|
            self.tags.build(tag_attributes)
        end
    end
end
