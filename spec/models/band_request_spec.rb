require 'rails_helper'

RSpec.describe BandRequest, type: :model do
  let(:band) { create :band }
  let(:musician) { create :musician }

  it 'validates with musician and band' do
    band_request = BandRequest.new(band: band, musician: musician)
    expect(band_request).to be_valid
  end
end
