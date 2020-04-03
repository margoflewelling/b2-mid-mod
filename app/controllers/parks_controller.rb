class ParksController < ApplicationController

  def show
    @park = Park.find(params[:park_id])
    @rides = @park.rides.order(:name)
  end

end
