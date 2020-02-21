# frozen_string_literal: true

class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :first_name
      t.string :last_name
      t.string :class
      t.string :race
      t.string :level
      t.int :health
      t.int :damage
      t.references :player, null: false, foreign_key: true
      t.references :campaign, null: false, foreign_key: true

      t.timestamps
    end
  end
end
