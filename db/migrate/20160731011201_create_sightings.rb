class CreateSightings < ActiveRecord::Migration
  def change
    create_table :sightings do |t|
      t.text :information
      t.string :picture
      t.references :pokemon, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
