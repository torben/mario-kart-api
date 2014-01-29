class CupMembersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_cup
  before_filter :set_cup_member, only: [:update, :destroy]

  def create
    user = User.where({id: params[:cup_member][:user_id]}).first
    @cup_member = @cup.cup_members.new(cup_member_params)
    @cup_member.character_id = user.try(:last_character_id) if @cup_member.character_id.blank?
    @cup_member.vehicle_id = user.try(:last_vehicle_id) if @cup_member.vehicle_id.blank?

    @cup_member.save
  end

  def update
    @cup_member.update_attributes(cup_member_params)
  end

  def destroy
    if @cup_member.destroy
      head :ok
    else
      head :false
    end
  end

  protected

    def cup_member_params
      if current_user.id == @cup.user_id
        params.require(:cup_member).permit(:user_id, :vehicle_id, :character_id, :state, :placement, :points)
      else
        params.require(:cup_member).permit(:user_id, :vehicle_id, :character_id, :state)
      end
    end

    def set_cup
      @cup = Cup.find params[:cup_id]
    end

    def set_cup_member
      @cup_member = @cup.cup_members.where(id: params[:id]).first!
    end
end