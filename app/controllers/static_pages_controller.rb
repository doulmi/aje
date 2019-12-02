class StaticPagesController < ApplicationController
  def home
    @carousels = Carousel::all()
    catid = params[:catid] || '本会章程'
    @article = Article.find_by(title: catid)
  end

  def help
  end

  def about
  end

  def contact
  end

  def admin
  end
end
