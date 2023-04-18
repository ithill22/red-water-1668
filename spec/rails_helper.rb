# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'
SimpleCov.start

require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end
end

def test_data
  @chef_1 = Chef.create!(name: "Emeril Lagasse")
  @chef_2 = Chef.create!(name: "Gordon Ramsay")
  @chef_3 = Chef.create!(name: "Guy Fieri")
  @chef_4 = Chef.create!(name: "Bobby Flay")

  @dish_1 = @chef_1.dishes.create!(name: "Chicken Parm", description: "Chicken Parmesan is a dish of chicken cutlet, topped with tomato sauce and melted cheese, usually mozzarella.")
  @dish_2 = @chef_2.dishes.create!(name: "Fish and Chips", description: "Fish and chips is a hot dish of English origin consisting of fried battered fish and hot chips.")
  @dish_3 = @chef_3.dishes.create!(name: "Burger", description: "A hamburger is a sandwich consisting of one or more cooked patties of ground meat, usually beef, placed inside a sliced bread roll or bun.")
  @dish_4 = @chef_4.dishes.create!(name: "Steak", description: "A steak is a meat generally sliced across the muscle fibers, potentially including a bone.")

  @ingredient_1 = Ingredient.create!(name: "Chicken", calories: 100)
  @ingredient_2 = Ingredient.create!(name: "Parmesan", calories: 50)
  @ingredient_3 = Ingredient.create!(name: "Tomato Sauce", calories: 25)
  @ingredient_4 = Ingredient.create!(name: "Mozzarella", calories: 75)
  @ingredient_5 = Ingredient.create!(name: "Fish", calories: 100)
  @ingredient_6 = Ingredient.create!(name: "Chips", calories: 200)
  @ingredient_7 = Ingredient.create!(name: "Bread", calories: 100)
  @ingredient_8 = Ingredient.create!(name: "Beef", calories: 200)
  @ingredient_9 = Ingredient.create!(name: "Steak", calories: 300)
  @ingredient_10 = Ingredient.create!(name: "Bun", calories: 50)

  @dish_ingredients_1 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_1.id)
  @dish_ingredients_2 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_2.id)
  @dish_ingredients_3 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_3.id)
  @dish_ingredients_4 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_4.id)
  @dish_ingredients_5 = DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingredient_5.id)
  @dish_ingredients_6 = DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingredient_6.id)
  @dish_ingredients_7 = DishIngredient.create!(dish_id: @dish_3.id, ingredient_id: @ingredient_7.id)
  @dish_ingredients_8 = DishIngredient.create!(dish_id: @dish_3.id, ingredient_id: @ingredient_8.id)
  @dish_ingredients_9 = DishIngredient.create!(dish_id: @dish_4.id, ingredient_id: @ingredient_9.id)
  @dish_ingredients_10 = DishIngredient.create!(dish_id: @dish_4.id, ingredient_id: @ingredient_10.id)
end
