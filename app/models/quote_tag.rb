class QuoteTag < ApplicationRecord
    validates :book_id, presence:true, allow_nil: true 
    validates :movie_id, presence:true, allow_nil: true 

    validate :book_id_xor_movie_id

  private

    def book_id_xor_movie_id
      unless book.blank? ^ movie.blank?
        errors.add(:base, "Please specify a book or a movie, but not both")
      end
    end

end
