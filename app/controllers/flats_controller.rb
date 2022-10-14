class FlatsController < ApplicationController
  before_action :set_flat, only: [:destroy, :edit, :show, :update]
  IMG = 'https://source.unsplash.com/featured/1600x900?house,apartment'

  def index
    if params[:query].present?
      @query = params[:query]
      @flats = Flat.where("name LIKE ?", "%#{params[:query]}%")
    else
      @flats = Flat.all
    end
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @image = IMG
  end

  def edit
  end

  def update
    if @flat.update(flat_params)
      redirect_to flat_path(@flat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @flat.destroy
    redirect_to flats_path, status: :see_other
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end
end
