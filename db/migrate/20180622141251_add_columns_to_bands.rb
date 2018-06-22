class AddColumnsToBands < ActiveRecord::Migration[5.2]
  def change
    add_column :bands, :title, :string
    add_column :bands, :description, :string
    add_reference :bands, :genre, foreign_key: true
  end
end
