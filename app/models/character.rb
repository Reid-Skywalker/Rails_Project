class Character < ApplicationRecord
  belongs_to :campaigns
  belongs_to :players
end
