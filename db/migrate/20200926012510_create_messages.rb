class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :content, null: false
      t.boolean :id_user, null: false
      t.references :room, null: false, foreign_key: true
      t.timestamps
    end
  end
end