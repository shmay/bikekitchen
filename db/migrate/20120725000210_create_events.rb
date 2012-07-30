class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :name
      t.datetime :day

      t.timestamps
    end
  end
end
