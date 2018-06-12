ActiveAdmin.register BandRequest do
  permit_params :musician_id, :band_id, :body, :status
end
