class CreateWikipedics < ActiveRecord::Migration[6.1]
  def change
    create_table :wikipedics do |t|
      t.string :url
      t.boolean :found
      t.integer :year
      t.references :book, null: false, foreign_key: true
      t.string :source

      t.timestamps
    end
  end
end
