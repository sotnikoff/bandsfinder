class Musician < ApplicationRecord
  belongs_to :user
  has_many :musician_skills
  update_index('musicians#musician')
end
