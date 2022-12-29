class SimilarBook < ApplicationRecord
  belongs_to :book
  belongs_to :another_book
end
