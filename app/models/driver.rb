class Driver < ActiveRecord::Base
  belongs_to :user
  belongs_to :character
  belongs_to :vehicle
  has_many :cup_members
  has_many :cups, through: :cup_members

  before_save :set_points_per_race

  scope :most_used, -> { order('drive_count DESC') }
end
