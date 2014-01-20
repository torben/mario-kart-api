class CupMember < ActiveRecord::Base
  belongs_to :cup
  belongs_to :user
  belongs_to :vehicle
  belongs_to :character

  scope :completed, -> { where('placement IS NOT NULL').where('vehicle_id IS NOT NULL').where('character_id IS NOT NULL') }

  symbolize :state, in: [:invited, :rejected, :accepted, :completed], scopes: true

  validates :state, presence: true
end
