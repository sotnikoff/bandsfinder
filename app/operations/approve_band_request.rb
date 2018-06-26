module ApproveBandRequest
  extend self

  def call(band_request)
    return nil unless band_request.status_new?
    band_request.status_approved!
    band = band_request.band
    musician = band_request.musician
    band.musicians << musician unless band.musicians.exists?(musician.id)
  end
end
