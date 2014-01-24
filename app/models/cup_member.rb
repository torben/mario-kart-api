class CupMember < ActiveRecord::Base
  belongs_to :cup
  belongs_to :user
  belongs_to :vehicle
  belongs_to :character

  after_create :send_apn

  scope :completed, -> { where('placement IS NOT NULL').where('vehicle_id IS NOT NULL').where('character_id IS NOT NULL') }

  symbolize :state, in: [:invited, :rejected, :accepted, :completed], scopes: true

  validates :state, presence: true

  def send_apn
    return if user == cup.user
    tokens = user.user_devices.map(&:apn_token).uniq
    cup_id = cup.id
    return if tokens.blank?

    Thread.new do
      payload = {:aps => {:alert => "Los jetzt. Es gibt ein Rennen zu fahren.", :sound => 'annoying_beep', cup_id: cup_id}}
      apn = []
      for token in tokens
        apn.push KwAPN::Notification.create(token, payload) if token.present?
      end
      status, ret = KwAPN::Sender.push(apn, 'TestSession')
    end
  end
end
