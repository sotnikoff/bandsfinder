class BandRequestPolicy < ApplicationPolicy
  def create?
    true if user.present? && user.musician.present?
  end

  def approve?
    # false if user.present? && band_request.musician.user == user
    false
  end

  private

  def band_request
    record
  end
end
