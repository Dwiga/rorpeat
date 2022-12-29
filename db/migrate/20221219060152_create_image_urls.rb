class CreateImageUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :image_urls do |t|
      t.references :book, null: false, foreign_key: true
      t.string :url

      t.timestamps
    end
  end
end
