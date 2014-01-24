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
    tokens = user.user_devices.map(&:apn_token).uniq.compact
    cup_id = cup.id
    return if tokens.blank?

    sound = case user.last_character.try(:name)
    when "Wario" then "sounds/mk64_wario06.wav"
    when "Bowser" then "sounds/bowser_5.wav"
    else
      "sounds/mk64_mario02.wav"
    end

    Thread.new do
      payload = {:aps => {:alert => "Los jetzt. Es gibt ein Rennen zu fahren.", :sound => sound, cup_id: cup_id}}
      apn = []
      for token in tokens
        apn.push KwAPN::Notification.create(token, payload) if token.present?
      end
      status, ret = KwAPN::Sender.push(apn, 'TestSession')
    end
  end
end
