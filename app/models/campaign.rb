# frozen_string_literal: true

class Campaign < ApplicationRecord
  has_many :campaign_monsters
  has_many :characters

  validates :Name, :Start_Date, presence: true
end
