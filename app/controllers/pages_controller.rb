class PagesController < ApplicationController
  def show
    @article = Article.find_by(id: params[:id])
    if @article.nil?
      @article = Article.find_by(title: params[:id])
    end
  end

  def index
    type = params[:type] || 'new'
    @articles = Article.where(level: type)
                    .order(created_at: :desc)
                    .select(:title, :rendered_content, :created_at)
  end
end
