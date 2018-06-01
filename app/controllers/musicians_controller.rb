class MusiciansController < ApplicationController
  def show; end

  def create
    Musician.find_or_create_by(user_id: current_user.id)
    redirect_to profile_path(current_user.id)
  end

  def update; end

  def edit; end

  def destroy
    musician = Musician.where(user_id: current_user.id).first
    Musician.destroy(musician.id)
    redirect_to profile_path(current_user.id)
  end
end
