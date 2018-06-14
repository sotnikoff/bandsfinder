class RemoveAndAddColumnsToCities < ActiveRecord::Migration[5.2]
  def change
    add_reference :cities, :region, index: true
    remove_column :cities, :country_id
  end
end
