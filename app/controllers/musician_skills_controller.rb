class MusicianSkillsController < ApplicationController
  def create
    MusicianSkill.create(permit_params)
    redirect_to edit_musician_path(permit_params[:musician_id])
  end

  def destroy
    MusicianSkill.destroy(params[:id])
    redirect_to edit_musician_path(params[:musician_id])
  end

  private

  def permit_params
    params.permit(:comment, :musician_id, :skill_id)
  end
end
