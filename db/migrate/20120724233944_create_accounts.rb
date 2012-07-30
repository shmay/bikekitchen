class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :title

      t.string :phone
      t.text :info

      t.string :logo_file_name
      t.string :logo_content_type
      t.integer :logo_file_size
      t.datetime :logo_updated_at

      t.string :name
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
