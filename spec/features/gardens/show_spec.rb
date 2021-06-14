require 'rails_helper'

RSpec.describe 'show' do
  before :each do
    @garden1 = Garden.create!(name: "Turing Community Garden", organic: true)

    @plot1 = @garden1.plots.create!(number: 25, size: "Large", direction: "East")
    @plot2 = @garden1.plots.create!(number: 23, size: "Medium", direction: "West")

    @plant1 = Plant.create!( name: "Bell Pepper", description: "Prefers rich, well draining soil.", days_to_harvest: 90)
    @plant2 = Plant.create!( name: "Eggplant", description: "Prefers Sunlight, well watered soil.", days_to_harvest: 100)
    @plant3 = Plant.create!( name: "Cucumber", description: "Prefers Sunlight, well watered soil.", days_to_harvest: 50)

    PlotsPlant.create!(plot_id: @plot1.id, plant_id: @plant1.id)
    PlotsPlant.create!(plot_id: @plot1.id, plant_id: @plant2.id)
    PlotsPlant.create!(plot_id: @plot2.id, plant_id: @plant2.id)
    PlotsPlant.create!(plot_id: @plot2.id, plant_id: @plant3.id)
  end

  describe 'list of all plants' do
    it 'has unique plant names list that take less than 100 days' do
      visit "/gardens/#{@garden1.id}"
      expect(page).to have_content(@garden1.name)
      expect(page).to have_content('Unique List Of Plants Planted In Garden Plots')
      expect(page).to have_content(@plant1.name)
      expect(page).to_not have_content(@plant2.name)
      expect(page).to have_content(@plant3.name)
    end
  end
end