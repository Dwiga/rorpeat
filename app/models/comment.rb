class Comment < ApplicationRecord
  self.inheritance_column = nil
  after_create_commit lambda {
    broadcast_prepend_to "comments_book_#{reference_id}",
                         partial: 'comments/comment',
                         locals: { comment: self },
                         target: 'comments'
  }

  after_destroy_commit lambda {
    broadcast_remove_to "comments_book_#{reference_id}"
  }
end
