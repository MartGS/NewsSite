# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :articles

  CATEGORY = %w[Авто Здоровье Финансы Происшествия].freeze

  validates :name, presence: true
end
