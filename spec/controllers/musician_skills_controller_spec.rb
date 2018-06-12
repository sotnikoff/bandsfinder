require 'rails_helper'

RSpec.describe MusicianSkillsController, type: :controller do
  describe 'POST #create' do
    it 'returns :found' do
      musician_skill = build :musician_skill
      post :create, params: {
        musician_id: musician_skill.musician.id,
        skill_id: musician_skill.skill.id,
        comment: musician_skill.comment
      }
    end
  end

  describe 'DELETE #destroy' do
    it 'returns :found' do
      musician_skill = create :musician_skill
      delete :destroy, params: {
          id: musician_skill.id,
          musician_id: musician_skill.musician.id
      }
    end
  end
end
