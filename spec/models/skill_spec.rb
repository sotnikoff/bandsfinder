require 'rails_helper'

RSpec.describe Skill, type: :model do
  it 'validates with title and description' do
    skill = Skill.new(title: 'Test', description: 'Test')
    expect(skill).to be_valid
  end

  it 'fails with only title' do
    skill = Skill.new(title: 'Test')
    expect(skill).not_to be_valid
  end

  it 'fails with only description' do
    skill = Skill.new(description: 'Test')
    expect(skill).not_to be_valid
  end

  it 'fails with short title and description' do
    skill = Skill.new(title: 'T', description: 'T')
    expect(skill).not_to be_valid
  end

  it 'fails with long title and description' do
    skill = Skill.new(title: 'Test' * 30, description: 'Test' * 1000)
    expect(skill).not_to be_valid
  end
end
