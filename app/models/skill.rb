class Skill < ApplicationRecord
  has_many :musician_skills
  validates :title, presence: true, length: { in: 3..100 }
  validates :description, presence: true, length: { in: 3..3000 }
end
