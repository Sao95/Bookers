class RemoveThoughtFromBook < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :thoughts, :text
  end
end
