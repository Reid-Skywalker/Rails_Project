# frozen_string_literal: true

class CampaignMonster < ApplicationRecord
  belongs_to :monster
  belongs_to :campaign

  validates :monster_id, :campaign_id, presence: true
  validates :monster_id, :campaign_id, numericality: { only_integer: true }
end
