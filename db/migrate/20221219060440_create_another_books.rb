class CreateAnotherBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :another_books do |t|
      t.string :name

      t.timestamps
    end
  end
end
