class Genre < ApplicationRecord
  validates :title, presence: true, length: { in: 2..200 }
  validates :description, presence: true, length: { in: 3..2000 }
end
