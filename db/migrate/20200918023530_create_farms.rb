class CreateFarms < ActiveRecord::Migration[6.0]
  def change
    create_table :farms do |t|
      t.string :name, null: false
      t.integer :prefecture_id, null: false
      t.text :description, null: false
      t.text :feature, null: false
      t.references :farmer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
