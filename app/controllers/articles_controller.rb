# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @articles = Article.includes(:user).order(created_at: :desc)
  end

  def show; end

  def destroy
    authorize @article
    
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_path, notice: 'Статья была успешно удалена.' }
      format.turbo_stream
    end
  end

  def new
    Rails.cache.fetch(session.id) { Hash.new }
    redirect_to build_article_path(Article.form_steps.keys.first)
  end

  private

  def article_params
    params.require(:article).permit(:title, :source, :link, :html, :category, :age_group)
  end

  def set_article
    return @article = Article.find(params[:id]) if params[:id]
  end
end
