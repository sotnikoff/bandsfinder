class BandRequest < ApplicationRecord
  enum status: { status_new: 'new', status_approved: 'approved', status_declined: 'declined' }
  belongs_to :musician
  belongs_to :band

  validates :body, allow_blank: true, length: { in: 3..3000 }
end
