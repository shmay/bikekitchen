class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :instructor
      t.string :time
      t.integer :slots
      t.datetime :day

      t.integer :account_id
      t.timestamps
    end
  end
end
