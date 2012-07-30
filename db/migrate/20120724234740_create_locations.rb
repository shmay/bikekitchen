class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.references :account
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.decimal :lat,  :precision => 15, :scale => 10
      t.decimal :lng,  :precision => 15, :scale => 10
      t.string :phone
      t.text   :hours

      t.timestamps
    end
  end
end
