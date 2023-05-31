class PartsController < ApplicationController
  before_action :set_part, only: [:show, :edit, :update, :destroy]

  def new
    @part = Part.new
    authorize @part
  end

  def create
    @part = Part.new(part_params)
    @part.user = current_user
    authorize @part
    if @part.save
      flash[:success] = "Yay! 🎉 you successfully created a part"
      redirect_to root_path
    else
      render :new
    end
  end

  # def index
  #   @parts = policy_scope(Part)
  # end
    def index
        @parts = Part.where(completed: false)
    end

  def show
    authorize @part
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
    authorize @part
  end

  private

  def part_params
    params.require(:part).permit(:name, :category, :origin, :years, :description, :price, :photo)
  end

  def set_part
    @part = Part.find(params[:id])
  end
end
