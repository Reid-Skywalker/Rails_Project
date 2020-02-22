# frozen_string_literal: true

class CreateMonsters < ActiveRecord::Migration[6.0]
  def change
    create_table :monsters do |t|
      t.string :name
      t.integer :level
      t.integer :health
      t.integer :damage

      t.timestamps
    end
  end
end
