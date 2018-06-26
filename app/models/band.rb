class Band < ApplicationRecord
  belongs_to :user
  has_many :band_requests
  has_and_belongs_to_many :musicians
  belongs_to :genre

  has_one_attached :image
end
