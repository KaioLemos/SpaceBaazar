class AddCompletedToParts < ActiveRecord::Migration[7.0]
  def change
    add_column :parts, :completed, :boolean
  end
end
