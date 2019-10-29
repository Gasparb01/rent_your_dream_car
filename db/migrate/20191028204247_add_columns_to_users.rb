class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :full_name, :string
    add_column :users, :age, :integer
    add_column :users, :driver_licence, :string
  end
end
