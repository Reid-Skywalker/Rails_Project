# frozen_string_literal: true

class Monster < ApplicationRecord
  validates :name, :level, :health, :damage, presence: true
  validates :level, :health, :damage, numericality: { only_integer: true }
end
