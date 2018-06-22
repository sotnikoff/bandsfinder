ActiveAdmin.register City do
  permit_params :title, :region_id, :code
end
