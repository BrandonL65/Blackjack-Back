class ChipsController < ApplicationController

    def index 
        chip = Chip.all 
        render json: chip 
    end 

    def show 
        chip = Chip.find(params[:id])
        render json: chip
    end 

    def update 
        chip = Chip.find(params[:id])
        chip.update(amount: params[:amount])
    end 
end
