require 'rails_helper'

RSpec.describe BandRequest, type: :model do
  let(:band) { create :band }
  let(:musician) { create :musician }

  it 'validates with musician and band' do
    band_request = BandRequest.new(band: band, musician: musician, body: 'Hello')
    expect(band_request).to be_valid
    expect(band_request.status_new?).to eq(true)
  end

  it 'fails without band' do
    band_request = BandRequest.new(musician: musician, body: 'Hello')
    expect(band_request).not_to be_valid
  end

  it 'fails without musician' do
    band_request = BandRequest.new(band: band, body: 'Hello')
    expect(band_request).not_to be_valid
  end

  it 'fails with short body' do
    band_request = BandRequest.new(band: band, musician: musician, body: 's')
    expect(band_request).not_to be_valid
  end

  it 'fails with long body' do
    band_request = BandRequest.new(band: band, musician: musician, body: 'long' * 1000)
    expect(band_request).not_to be_valid
  end
end
