class ArticlesController < ApplicationController
  before_action only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find_by(id: params[:id])
    if @article.nil?
      @article = Article.find_by(title: params[:id])
    end
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html {redirect_to @article, notice: 'Article was successfully created.'}
        format.json {render :show, status: :created, location: @article}
      else
        format.html {render :new}
        format.json {render json: @article.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    @article = Article.find(params[:id])
    respond_to do |format|
      if @article.update(article_params)
        format.html {redirect_to @article, notice: 'Article was successfully updated.'}
        format.json {render :show, status: :ok, location: @article}
      else
        format.html {render :edit}
        format.json {render json: @article.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    respond_to do |format|
      format.html {redirect_to articles_url, notice: 'Article was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def article_params
    params.require(:article).permit(:title, :raw_content, :rendered_content, :level)
  end
end
