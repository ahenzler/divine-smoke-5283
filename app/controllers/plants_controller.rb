class PlantsController < ApplicationController

  def delete
    plot = Plot.find(params[:plot_id])
    plant = Plant.find(params[:plant_id])
    plot.plants.delete(plant)
    redirect_to "/plots"
  end
end