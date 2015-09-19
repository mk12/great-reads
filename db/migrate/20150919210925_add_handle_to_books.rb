class AddHandleToBooks < ActiveRecord::Migration
  def change
    add_column :books, :handle, :string
    change_column_null :books, :handle, false
  end
end
