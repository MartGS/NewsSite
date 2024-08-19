module ArticlesHelper
  def date_format
    YAML.load_file(Rails.root.join('config/date_formats.yml'))['date_format']
  end
end
