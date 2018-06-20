require 'rails_helper'

RSpec.describe MusicianSkillsController, type: :controller do
  describe 'POST #create' do
    it 'returns :found' do
      musician = create :musician
      sign_in musician.user
      musician_skill = build :musician_skill
      post :create, params: {
        musician_id: musician.id,
        skill_id: musician_skill.skill.id,
        comment: musician_skill.comment
      }
      expect(response).to have_http_status(:found)
    end
  end

  describe 'DELETE #destroy' do
    it 'returns :found' do
      musician_skill = create :musician_skill
      sign_in musician_skill.musician.user
      delete :destroy, params: {
        id: musician_skill.id,
        musician_id: musician_skill.musician.id
      }
      expect(response).to have_http_status(:found)
    end
  end
end
