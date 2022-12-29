class CreateSimilarBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :similar_books do |t|
      t.references :book, null: false, foreign_key: true
      t.references :another_book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
