class City < ApplicationRecord
  belongs_to :country
  has_many :users

  validates :title, presence: true, length: { in: 3..200 }
  validates :code, allow_blank: true, length: { in: 3..200 }
end
