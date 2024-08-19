namespace :data do
  desc "Перенос данных из category_id в category"
  task transfer_category: :environment do
    Article.reset_column_information

    Article.find_each do |article|
      category = Category.find_by(id: article.category_id) if article.category_id
        
      article.update(category: category.name) if category

      puts "Категория с ID #{article.category_id} не найдена для статьи '#{article.title}'" if !category
    end

    puts "Перенос категорий завершен!"
  end
end
