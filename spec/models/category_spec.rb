# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:valid_attributes) { { name: 'Здоровье' } }

  describe '#create' do
    it 'is valid with valid attributes' do
      category = Category.new(valid_attributes)
      expect(category).to be_valid
    end
  end
end
