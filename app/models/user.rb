class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :user_devices
  has_many :cup_members
  has_many :cups, through: :cup_members
  has_many :characters, through: :cup_members
  has_many :vehicles, through: :cup_members

  belongs_to :last_character, class_name: "Character"
  belongs_to :last_vehicle, class_name: "Vehicle"

  before_create :create_api_key
  before_save :set_points_per_race

  mount_uploader :avatar, AvatarUploader

  def create_api_key
    self.api_key = SecureRandom.hex
  end

  def set_points_per_race
    if drive_count.blank? || drive_count == 0
      self.points_per_race = 0
    else
      self.points_per_race = total_points / drive_count
    end
  end

  def last_cup_member
    @last_cup_member ||= cup_members.completed.order('created_at DESC').first
  end

  def image_data=(data)
    io = CarrierStringIO.new(Base64.decode64(data))

    self.avatar = io
  end
end

class CarrierStringIO < StringIO
  def original_filename
    "photo_#{Time.now.to_i}.jpg"
  end

  def content_type
    "image/jpeg"
  end
end