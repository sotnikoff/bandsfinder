class BandRequestPolicy < ApplicationPolicy
  def create?
    true if user.present? && user.musician.present?
  end

  def approve?
    true if user.present? && band_request.musician.user == user
  end

  private

  def band_request
    record
  end
end
