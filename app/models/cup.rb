class Cup < ActiveRecord::Base
  has_many :cup_members
  has_many :users, through: :cup_members

  belongs_to :user
  belongs_to :winning_user, class_name: 'User'

  scope :finished, -> { where('winning_user_id IS NOT NULL') }

  before_save :update_user_stats

  def update_user_stats
    return unless winning_user_id_changed?

    cup_members.where("points IS NOT NULL").order(:points).each_with_index do |cup_member, i|
      user = cup_member.user

      user.win_count += 1 if user.id == winning_user_id
      user.drive_count += 1
      user.total_points += cup_member.points
      user.save

      cup_member.update_attribute(:placement, i+1)
    end

    cup_members.where("points IS NULL").delete_all
  end
end
