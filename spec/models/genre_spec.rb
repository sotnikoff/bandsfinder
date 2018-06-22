require 'rails_helper'

RSpec.describe Genre, type: :model do
  it 'validates with title and description' do
    genre = Genre.new(title: 'Hard Rock', description: 'Classic Hard Rock')
    expect(genre).to be_valid
  end

  it 'fails with only title' do
    genre = Genre.new(title: 'Hard Rock')
    expect(genre).not_to be_valid
  end

  it 'fails with long title' do
    genre = Genre.new(title: 'Hard Rock' * 100, description: 'Classic Hard Rock')
    expect(genre).not_to be_valid
  end

  it 'fails with short title' do
    genre = Genre.new(title: 'H', description: 'Classic Hard Rock')
    expect(genre).not_to be_valid
  end

  it 'fails with long description' do
    genre = Genre.new(title: 'Hard Rock', description: 'Classic Hard Rock' * 500)
    expect(genre).not_to be_valid
  end

  it 'fails with short description' do
    genre = Genre.new(title: 'Hard Rock', description: 'C')
    expect(genre).not_to be_valid
  end

  it 'fails without attributes' do
    genre = Genre.new
    expect(genre).not_to be_valid
  end
end
