require 'rails_helper'

describe Ride, type: :model do
  describe "relationships" do
    it {should belong_to :park}
    it {should have_many :mechanic_rides}
    it {should have_many(:mechanics).through(:mechanic_rides)}
  end

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :thrill_rating}
    it {should validate_inclusion_of(:thrill_rating).
        in_range(1..10) }
  end

end
