class MusicianSkill < ApplicationRecord
  belongs_to :musician
  belongs_to :skill
end
