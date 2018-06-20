class City < ApplicationRecord
  belongs_to :region
  has_many :users

  scope :alphabetical, -> { order('title ASC').all }

  validates :title, presence: true, length: { in: 3..200 }
  validates :code, allow_blank: true, length: { in: 3..200 }
end
