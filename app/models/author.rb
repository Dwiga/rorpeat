class Author < ApplicationRecord
    validates :name, presence: true, length: { minimum: 1 }

    has_one :wikipedium, dependent: :destroy
    has_many :books
end
