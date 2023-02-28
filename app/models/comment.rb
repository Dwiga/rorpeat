class Comment < ApplicationRecord
  self.inheritance_column = nil
  after_create_commit -> {
                         broadcast_prepend_to "comments_book_#{self.reference_id}",
                         partial: "comments/comment",
                         locals: { comment: self },
                         target: "comments"
  }
end
