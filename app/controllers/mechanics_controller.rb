class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:mechanic_id])
  end

  def update
    @mechanic = Mechanic.find(params[:mechanic_id])
    @mechanic.add_ride(params[:ride])
  end

end
