class MechanicsController < ApplicationController
  def index
    binding.pry
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def update
    @mechanic = Mechanic.find(params[:id])
    ride = Ride.where(id: params[:add_ride])
    @mechanic.add_ride(ride)
    @mechanic.save
    redirect_to "/mechanics/#{@mechanic.id}"
  end
end