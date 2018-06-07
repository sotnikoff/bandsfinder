class Band < ApplicationRecord
  belongs_to :user
  has_many :band_requests
end
