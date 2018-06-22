class MusiciansController < ApplicationController
  before_action :find_musician, only: %i[show edit]

  def show
    authorize @musician
  end

  def create
    musician = Musician.find_or_create_by(user_id: current_user.id)
    redirect_to musician_path(musician)
  end

  def update; end

  def edit
    authorize @musician
  end

  def destroy
    musician = Musician.where(user_id: current_user.id).first
    authorize musician
    Musician.destroy(musician.id)
    redirect_to profile_path(current_user.id)
  end

  private

  def find_musician
    @musician = Musician.find(params[:id])
    authorize @musician
  end
end
