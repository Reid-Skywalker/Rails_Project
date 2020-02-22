# frozen_string_literal: true

class CreateCampaignMonsters < ActiveRecord::Migration[6.0]
  def change
    create_table :campaign_monsters do |t|
      t.references :monster, null: false, foreign_key: true
      t.references :campaign, null: false, foreign_key: true

      t.timestamps
    end
  end
end
