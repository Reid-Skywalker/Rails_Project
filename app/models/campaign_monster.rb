class CampaignMonster < ApplicationRecord
  belongs_to :monster
  belongs_to :campaign
end
