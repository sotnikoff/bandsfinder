class Region < ApplicationRecord
  belongs_to :country
  has_many :cities

  scope :alphabetical, -> { order('title ASC').all }

  validates :title, presence: true, length: { in: 3..200 }
  validates :code, allow_blank: true, length: { in: 3..200 }
end
