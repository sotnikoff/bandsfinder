class CreateMusicianSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :musician_skills do |t|
      t.references :musician, foreign_key: true
      t.references :skill, foreign_key: true
      t.text :comment
      t.timestamps
    end
  end
end
