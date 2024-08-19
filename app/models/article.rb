# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :user

  AGE_GROUP = %w[0+ 6+ 12+ 16+ 18+].freeze
  CATEGORY = %w[Авто Здоровье Финансы Происшествия].freeze

  before_save :sanitize_content

  enum form_step: {
    first_step: %i[title source link],
    second_step: [:html],
    third_step: %i[category age_group]
  }

  attribute :form_step, :string

  with_options if: -> { required_for_step?(:first_step) } do
    validates :title, presence: true
    validates :source, presence: true
  end

  with_options if: -> { required_for_step?(:second_step) } do
    validates :html, presence: true
  end

  with_options if: -> { required_for_step?(:third_step) } do
    validates :category, presence: true
  end

  def required_for_step?(step)
    return true if form_step.nil?

    ordered_keys = self.class.form_steps.keys.map(&:to_sym)
    !!(ordered_keys.index(step) <= ordered_keys.index(form_step.to_sym))
  end

  private

  def sanitize_content
    self.html = ActionController::Base.helpers.sanitize(html)
  end
end
