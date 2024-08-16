# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:user) { User.create!(email: 'test@example.com', password: 'password') }

  let(:valid_attributes) do
    {
      title: 'Test Article',
      source: 'Test Source',
      html: '<p>Test HTML</p>',
      user:,
      category: 'Авто'
    }
  end

  describe '#create' do
    it 'is valid with valid attributes' do
      article = Article.new(valid_attributes)
      expect(article).to be_valid
    end
  end
end
