class Genre < ApplicationRecord
  validates :title, presence: true, length: { in: 2..200 }
  validates :description, presence: true, length: { in: 3..2000 }

  has_many :bands
  scope :for_select, -> { Genre.order('title ASC').all.map { |g| [g.title, g.id] } }
end
