require 'rails_helper'

RSpec.describe 'index' do
  before :each do
    @garden1 = Garden.create!(name: "Turing Community Garden", organic: true)
    @garden2 = Garden.create!(name: "Westminster Community Garden", organic: true)

    @plot1 = @garden1.plots.create!(number: 25, size: "Large", direction: "East")
    @plot2 = @garden2.plots.create!(number: 23, size: "Medium", direction: "West")

    @plant1 = Plant.create!( name: "Bell Pepper", description: "Prefers rich, well draining soil.", days_to_harvest: 90)
    @plant2 = Plant.create!( name: "Eggplant", description: "Prefers Sunlight, well watered soil.", days_to_harvest: 70)
    @plant3 = Plant.create!( name: "Cucumber", description: "Prefers Sunlight, well watered soil.", days_to_harvest: 50)

    PlotsPlant.create!(plot_id: @plot1.id, plant_id: @plant1.id)
    PlotsPlant.create!(plot_id: @plot1.id, plant_id: @plant2.id)
    PlotsPlant.create!(plot_id: @plot2.id, plant_id: @plant2.id)
    PlotsPlant.create!(plot_id: @plot2.id, plant_id: @plant3.id)

    visit "/plots"
  end

  describe 'list of all plot numbers and plant names' do
    it 'has plot numbers' do
      expect(page).to have_content(@plot1.number)
      expect(page).to have_content(@plot2.number)
    end

    it 'has plant names for each plot' do
      expect(page).to have_content(@plant1.name)
      expect(page).to have_content(@plant2.name)
      expect(page).to have_content(@plant3.name)
    end

    it 'can remove plant' do
      expect(page).to have_button("Remove #{@plant1.name}")
      click_on("Remove #{@plant1.name}")
      expect(page).to_not have_content(@plant1.name)
    end
  end
end
