# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category

  AGE_GROUP = %w[0+ 6+ 12+ 16+ 18+].freeze

  validates :title, presence: true
  validates :source, presence: true
  validates :html, presence: true
  validates :category, presence: true
end
