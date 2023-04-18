require 'rails_helper'

RSpec.describe 'Dish Show Page' do
  before :each do
    test_data
  end

  describe 'As a visitor, when I visit the dish show page' do
    it 'I see the dish name, description, ingredients, calories, and the chefs name' do
      visit dish_path(@dish_1)

      expect(page).to have_content(@dish_1.name)
      expect(page).to have_content(@dish_1.description)
      expect(page).to have_content(@dish_1.total_calories)
      expect(page).to have_content(@chef_1.name)
      
      within "#ingredient-list" do
        expect(page).to have_content(@ingredient_1.name)
        expect(page).to have_content(@ingredient_2.name) 
        expect(page).to have_content(@ingredient_3.name)
      end
    end
  end
end