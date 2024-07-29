# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

ActiveRecord::Base.transaction do
  User.destroy_all
  Category.destroy_all
  Article.destroy_all

  5.times do
    User.create!(
      email: Faker::Internet.unique.email,
      password: 'password',
      password_confirmation: 'password'
    )
  end

  Category::CATEGORY.each do |category_name|
    Category.create!(name: category_name)
  end

  users = User.all
  categories = Category.all

  10.times do
    Article.create!(
      title: Faker::Lorem.sentence(word_count: 3),
      source: Faker::Company.name,
      link: Faker::Internet.url,
      html: Faker::Lorem.paragraphs(number: 3).join("\n\n"),
      age_group: Article::AGE_GROUP.sample,
      user: users.sample,
      category: categories.sample
    )
  end

  puts "Создано #{User.count} пользователей, #{Category.count} категорий и #{Article.count} статей."
end
