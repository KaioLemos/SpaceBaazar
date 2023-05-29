class PartsController < ApplicationController
    before_action :set_part, only: [:show, :edit, :update, :destroy]
    
    def new
        @part = Part.new
    end
    def create
        @part = Part.new(part_params)
        @part.user = current_user
        if @part.save
            redirect_to part_path(@part)
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
    end
    def update
    end
    def destroy
    end
    private
    def part_params
        params.require(:part).permit(:name, :category, :origin, :years, :description, :price)
    end
    def set_part
        @part = Part.find(params[:id])
    end
end
