module StepsControllers
  class ArticleStepsController < ApplicationController
    include Wicked::Wizard

    steps(*Article.form_steps.keys)

    def show
      article_attrs = Rails.cache.read session.id
      @article = current_user.articles.new article_attrs
      render_wizard
    end

    def update
      article_attrs = Rails.cache.read(session.id).merge article_params
      @article = current_user.articles.new article_attrs

      if @article.valid?
        Rails.cache.write session.id, article_attrs
        redirect_to_next next_step
      else
        render_wizard @article
      end
    end

    private

    def article_params
      params.require(:article).permit(*permitted_params).merge!(form_step: step.to_sym)
    end

    def permitted_params
      Article.form_steps[step] + [:form_step]
    end

    def finish_wizard_path
      article_attrs = Rails.cache.fetch(session.id)
      @article = current_user.articles.new article_attrs
      @article.save!
      Rails.cache.delete session.id
      article_path(@article)
    end
  end
end
