class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :type
      t.string :name
      t.text :message
      t.integer :reference_id

      t.timestamps
    end
  end
end
