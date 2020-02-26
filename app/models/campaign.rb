# frozen_string_literal: true

class Campaign < ApplicationRecord
  has_many :characters
  has_many :campaign_monsters
  has_many :monsters, through: :campaign_monsters

  validates :name, :start_date, presence: true
end
