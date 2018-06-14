module DeclineBandRequest
  extend self

  def call(band_request)
    band_request.status_declined! if band_request.status_new?
  end
end
