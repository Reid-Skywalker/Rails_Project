# frozen_string_literal: true

class CreateMonsters < ActiveRecord::Migration[6.0]
  def change
    create_table :monsters do |t|
      t.string :name
      t.int :level
      t.int :health
      t.int :damage
      t.campaign_monsters :has_many

      t.timestamps
    end
  end
end
