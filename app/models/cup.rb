class Cup < ActiveRecord::Base
  has_many :cup_members
  has_many :users, through: :cup_members

  belongs_to :user
  belongs_to :winning_user, class_name: 'User'

  scope :finished, -> { where('winning_user_id IS NOT NULL') }

  before_save :update_user_stats

  def update_user_stats
    Rails.logger.info winning_user_id_changed?
    return unless winning_user_id_changed?

    cup_members.where(state: :accepted).where('placement IS NOT NULL').each do |cup_member|
      user = cup_member.user

      user.win_count += 1 if user.id == winning_user_id
      user.drive_count += 1
      user.total_points += cup_member.points
      user.save
    end
  end
end
