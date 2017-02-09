class CreateHousesTable < ActiveRecord::Migration
  def change
    create_table :houses_tables do |t|
      t.string :address, null: false
      t.timestamps
    end
  end
end
