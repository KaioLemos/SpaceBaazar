class PartsController < ApplicationController
  before_action :set_part, only: [:show, :edit, :update, :destroy]

  def new
    @part = Part.new
  end

  def create
    @part = Part.new(part_params)
    @part.user = current_user
    if @part.save
      flash[:success] = "Yay! 🎉 you successfully created a part"
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @parts = Part.all
  end

  def show
  end

  def edit
    authorize @part
  end

  def update
    authorize @part
    if @part.update(part_params)
      redirect_to @part, notice: "Part was successfully updated"
    else
      render :edit, status: :unprocessable_entity
      before_action :set_part, only: [:show, :edit, :update, :destroy]
    end
  end

  def destroy
  end

  private

  def part_params
    params.require(:part).permit(:name, :category, :origin, :years, :description, :price, :photo)
  end

  def set_part
    @part = Part.find(params[:id])
  end
end
