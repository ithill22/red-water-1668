require 'rails_helper'

RSpec.describe 'Chef Show Page' do
  before :each do
    test_data
  end

  describe 'As a visitor, when i visit a chefs show page' do
    it 'I see a link to view all ingredients that this chef uses in their dishes' do
      visit chef_path(@chef_1)

      expect(page).to have_link("View All Ingredients")

      click_link "View All Ingredients"

      expect(current_path).to eq(chef_ingredients_path(@chef_1))
    end
  end
end