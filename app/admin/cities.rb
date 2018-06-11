ActiveAdmin.register City do
  permit_params :title, :country_id, :code
end
