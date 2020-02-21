# frozen_string_literal: true

class CreateCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :campaigns do |t|
      t.string :Name
      t.date :Start_Date
      t.campaign_monsters :has_many
      t.characters :has_many

      t.timestamps
    end
  end
end
