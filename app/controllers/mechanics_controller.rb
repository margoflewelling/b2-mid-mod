class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:mechanic_id])
  end

  def update
    @mechanic = Mechanic.find(params[:mechanic_id])
    ride = Ride.find(params[:ride])
    if @mechanic.rides.include?(ride)
        flash[:notice] = "#{@mechanic.name}is already working on #{ride.name}"
    else
    @mechanic.add_ride(params[:ride])
    MechanicRide.create(ride_id: params[:ride],
                        mechanic_id: @mechanic.id)
    end
    redirect_to "/mechanics/#{@mechanic.id}"

  end

end
