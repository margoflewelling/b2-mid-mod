require 'rails_helper'

RSpec.describe "Mechanics A user", type: :feature do
  before(:each) do
    @mechanic_1 = Mechanic.create(name: "Frank",
                                  years_experience: "12")
    @mechanic_2 = Mechanic.create(name: "Jane",
                                  years_experience: "5")
    @mechanic_3 = Mechanic.create(name: "Bob",
                                  years_experience: "2")


  end

  it "can see list of all mechanics" do
    visit "/mechanics"
    expect(page).to have_content("All Mechanics")
    expect(page).to have_content("#{@mechanic_1.name} - #{@mechanic_1.years_experience} years of experience")
    expect(page).to have_content("#{@mechanic_2.name} - #{@mechanic_2.years_experience} years of experience")
    expect(page).to have_content("#{@mechanic_3.name} - #{@mechanic_3.years_experience} years of experience")
    end

  end
