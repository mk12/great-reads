class ChangeBooksContentToFilename < ActiveRecord::Migration
  def change
    change_table :books do |t|
      t.remove :content
      t.string :filename
    end

    Book.update_all(filename: 'oliver_twist.html')

    change_column_null :books, :filename, false
  end
end
