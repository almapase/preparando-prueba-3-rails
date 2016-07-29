class CreatePokeDesks < ActiveRecord::Migration
  def change
    create_table :poke_desks do |t|
      t.references :user, index: true, foreign_key: true
      t.references :pokemon, index: true, foreign_key: true
      t.integer :level

      t.timestamps null: false
    end
  end
end
