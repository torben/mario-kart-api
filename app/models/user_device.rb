class UserDevice < ActiveRecord::Base
  belongs_to :user
  has_one :character
  has_one :vehicle
end
