class CreateGutenbergs < ActiveRecord::Migration[6.1]
  def change
    create_table :gutenbergs do |t|
      t.references :book, null: false, foreign_key: true
      t.string :url
      t.integer :num

      t.timestamps
    end
  end
end
