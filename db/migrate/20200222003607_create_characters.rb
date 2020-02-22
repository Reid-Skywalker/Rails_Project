# frozen_string_literal: true

class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :first_name
      t.string :last_name
      t.string :character_class
      t.string :race
      t.integer :level
      t.integer :health
      t.integer :damage
      t.references :player, null: false, foreign_key: true
      t.references :campaign, null: false, foreign_key: true

      t.timestamps
    end
  end
end
