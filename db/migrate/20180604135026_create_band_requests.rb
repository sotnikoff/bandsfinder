class CreateBandRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :band_requests do |t|
      t.references :musician, foreign_key: true
      t.references :band, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
