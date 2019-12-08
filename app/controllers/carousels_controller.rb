class CarouselsController < ApplicationController
  before_action :require_login
  before_action :set_carousel, only: [:show, :edit, :update, :destroy]

  # GET /carousels
  # GET /carousels.json
  def index
    @carousels = Carousel.all
  end

  # GET /carousels/1
  # GET /carousels/1.json
  def show
  end

  # GET /carousels/new
  def new
    @carousel = Carousel.new
  end

  # GET /carousels/1/edit
  def edit
    @carousel = Carousel.find_by(params[:id])
  end

  def create
    @carousel = Carousel.new(carousel_params)
    if @carousel.save
      @carousel.src.attach(carousel_params[:src])
      flash[:success] = '创建成功'
      redirect_to carousels_path
    else
      flash.now[:error] = '创建失败'
      render new
    end
  end

  # PATCH/PUT /carousels/1
  # PATCH/PUT /carousels/1.json
  def update
    if @carousel.update(carousel_params)
      @carousel.src.attach(carousel_params[:src])
      flash[:success] = '创建成功'
      redirect_to carousels_path
    else
      flash.now[:error] = '创建失败'
      render new
    end
  end

  # DELETE /carousels/1
  # DELETE /carousels/1.json
  def destroy
    @carousel.destroy
    respond_to do |format|
      format.html {redirect_to carousels_url, notice: 'Carousel was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_carousel
    @carousel = Carousel.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def carousel_params
    params.require(:carousel).permit(:title, :src, :url)
  end

  def require_login
    unless log_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_path
    end
  end
end
