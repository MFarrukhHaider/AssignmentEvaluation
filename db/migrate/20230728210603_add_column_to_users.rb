class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :full_name, :string
    add_column :users, :age, :integer
    add_column :users, :phone_number, :integer
    add_column :users, :address, :string
    add_column :users, :gender, :string
  end
end
