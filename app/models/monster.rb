# frozen_string_literal: true

class Monster < ApplicationRecord
  has_many :campaign_monsters
  has_many :campaigns, through: :campaign_monsters

  validates :name, :level, :health, :damage, presence: true
  validates :level, :health, :damage, numericality: { only_integer: true }
end
