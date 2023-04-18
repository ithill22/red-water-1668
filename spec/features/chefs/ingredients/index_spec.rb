require 'rails_helper'

RSpec.describe 'Chef Ingredients Index Page' do
  before :each do
    test_data
  end

  describe 'As a visitor, when i visit a chefs ingredients index page' do
    it 'I see a unique list of names of all the ingredients that this chef uses' do
      visit chef_ingredients_path(@chef_1)
save_and_open_page
      expect(page).to have_content(@ingredient_1.name)
      expect(page).to have_content(@ingredient_2.name)
      expect(page).to have_content(@ingredient_3.name)
      expect(page).to have_content(@ingredient_4.name)
      expect(page).to_not have_content(@ingredient_5.name)
    end
  end
end