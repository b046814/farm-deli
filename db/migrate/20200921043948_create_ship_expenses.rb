class CreateShipExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :ship_expenses do |t|

      t.timestamps
    end
  end
end
