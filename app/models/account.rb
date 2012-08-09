class Account < ActiveRecord::Base
  attr_accessible :title, :phone, :info, :city, :zip
  has_many :users
  has_many :events
end
