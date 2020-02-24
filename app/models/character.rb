# frozen_string_literal: true

class Character < ApplicationRecord
  belongs_to :player
  belongs_to :campaign

  validates :first_name, :last_name, :character_class, :race,
            :level, :health, :damage, presence: true
  validates :level, :health, :damage, numericality: { only_integer: true }
end
