class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.text :book_title
      t.text :thoughts

      t.timestamps
    end
  end
end
