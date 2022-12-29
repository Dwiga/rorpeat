class Book < ApplicationRecord
  belongs_to :author
  validates :title, presence: true

  has_many :wikipedics, dependent: :destroy
  has_many :image_urls, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :wikipedics, dependent: :destroy
  has_many :similar_books, dependent: :destroy
  has_many :another_books, through: :similar_books
  has_many :book_tags, dependent: :destroy
  has_many :tags, through: :book_tags
  has_one :gutenberg, dependent: :destroy
end
