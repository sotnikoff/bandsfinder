class MusicianSkillsController < ApplicationController
  before_action :authenticate_user!

  def create
    musician_skill = MusicianSkill.new(permit_params)
    authorize musician_skill
    notice = if musician_skill.save
               'Success'
             else
               'Failed'
             end
    redirect_to edit_musician_path(params[:musician_id]), notice: notice
  end

  def destroy
    musician_skill = MusicianSkill.find(params[:id])
    authorize musician_skill
    musician_skill.destroy
    redirect_to edit_musician_path(params[:musician_id])
  end

  private

  def permit_params
    params.permit(:comment, :musician_id, :skill_id)
  end
end
