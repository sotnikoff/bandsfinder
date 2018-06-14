ActiveAdmin.register Region do
  permit_params :title, :code, :country_id
end
