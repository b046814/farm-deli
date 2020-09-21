class CreatePeriods < ActiveRecord::Migration[6.0]
  def change
    create_table :periods do |t|

      t.timestamps
    end
  end
end
