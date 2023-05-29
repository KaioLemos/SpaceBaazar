class AddAttributesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :planet, :string
    add_column :users, :age, :integer
  end
end
