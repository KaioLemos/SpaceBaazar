class CreateParts < ActiveRecord::Migration[7.0]
  def change
    create_table :parts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :category
      t.string :origin
      t.integer :years
      t.string :name
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end
