class Musician < ApplicationRecord
  belongs_to :user
  has_many :musician_skills
  has_and_belongs_to_many :bands
end
