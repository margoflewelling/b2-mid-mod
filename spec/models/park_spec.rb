require 'rails_helper'

describe Park, type: :model do
  describe "relationships" do
    it {should have_many :rides}
  end

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :admission_price}
  end

  describe "model methods" do
    it "#average_thrill_rating" do
      park_1 = Park.create(name: "Disney",
                            admission_price: 50)
      ride_1 = park_1.rides.create(name: "Upside Down",
                            thrill_rating: 7)
      ride_2 = park_1.rides.create(name: "Tea Cups",
                            thrill_rating: 3)
    expect(park_1.average_thrill_rating).to eq(5.0)
    end
  end

end
