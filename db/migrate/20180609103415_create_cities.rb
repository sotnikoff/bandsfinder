class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :title
      t.string :code
      t.references :country, foreign_key: true

      t.timestamps
    end
  end
end
