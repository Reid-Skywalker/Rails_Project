# frozen_string_literal: true

class Player < ApplicationRecord
  has_many :characters

  validates :name, :registration_date, presence: true
end
