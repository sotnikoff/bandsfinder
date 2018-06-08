class CreateBandsMusicians < ActiveRecord::Migration[5.2]
  def change
    create_table :bands_musicians do |t|
      t.belongs_to :band, foreign_key: true
      t.belongs_to :musician, foreign_key: true
    end
  end
end
