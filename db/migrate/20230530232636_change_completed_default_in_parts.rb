class ChangeCompletedDefaultInParts < ActiveRecord::Migration[6.1]
  def change
    change_column_default :parts, :completed, from: nil, to: false
  end
end