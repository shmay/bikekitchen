class Event < ActiveRecord::Base
  attr_accessible :name, :time, :slots
  belongs_to :account
  has_and_belongs_to_many :users
end
