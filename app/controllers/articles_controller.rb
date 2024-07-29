# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @articles = Article.includes(:category, :user).order(created_at: :desc)
  end

  def show; end

  def destroy
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_path, notice: 'Статья была успешно удалена.' }
      format.turbo_stream
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user

    respond_to do |format|
      if @article.save
        format.html do
          flash[:notice] = 'Статья успешно создана.'
          redirect_to article_path(@article)
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :source, :link, :html, :age_group, :category_id)
  end

  def set_article
    return @article = Article.find(params[:id]) if params[:id]
  end
end
