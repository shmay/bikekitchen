class EventsUsers < ActiveRecord::Migration
  def change
    create_table :events_users, :id => false do |t|
      t.references :event, :user
    end
  end
end
