require 'rails_helper'

describe Mechanic, type: :model do
  describe "relationships" do
    it {should have_many :mechanic_rides}
    it {should have_many(:rides).through(:mechanic_rides)}
  end

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :years_experience}
  end

  describe "model methods" do
    it "#add_ride" do
      mechanic_1 = Mechanic.create(name: "Frank",
                                    years_experience: "12")
      park_1 = Park.create(name: "Disney",
                            admission_price: 50)
      ride_1 = park_1.rides.create(name: "Upside Down",
                            thrill_rating: 7)
      ride_2 = park_1.rides.create(name: "Tea Cups",
                            thrill_rating: 3)
      MechanicRide.create(ride_id: ride_1.id, mechanic_id: mechanic_1.id)


      expect(mechanic_1.rides).to eq([ride_1])

      mechanic_1.add_ride(ride_2.id)
      expect(mechanic_1.rides).to eq([ride_1, ride_2])
    end
  end

end
