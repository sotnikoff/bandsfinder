class BandRequest < ApplicationRecord
  enum status: [status_new: 'new', status_approved: 'approved', status_declined: 'declined']
  belongs_to :musician
  belongs_to :band
end
