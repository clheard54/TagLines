class Quote < ApplicationRecord
    has_many :quote_tags
    has_many :tags, through: :quote_tags
    belongs_to :user
    belongs_to :book, optional: true
    belongs_to :movie, optional:true
    validates :quote, presence:true
    accepts_nested_attributes_for :book
    accepts_nested_attributes_for :movie
    accepts_nested_attributes_for :tags
    validates :book_id, presence:true, allow_nil: true 
    validates :movie_id, presence:true, allow_nil: true 

    validate :book_id_xor_movie_id

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
            tag = Tag.create(tag_attributes)
            self.tags << tag
        end
    end

    def self.filter(search)
        result = []
        if search
            tag = Tag.find(search)
            if tag
              self.all.each {|quote|
                if quote.tags.include?(tag)
                    result << quote
                end
                }
            result
            else Quote.all
            end
        else
            Quote.all
        end
    end

  private

  def book_id_xor_movie_id
    unless book.blank? ^ movie.blank?
      errors.add(:base, "Please specify a book or a movie, but not both")
    end
  end

end
