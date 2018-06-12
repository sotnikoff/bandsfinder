class Country < ApplicationRecord
  has_many :cities

  validates :title, presence: true, length: { in: 3..200 }
  validates :code, length: { in: 1..200 }
end
