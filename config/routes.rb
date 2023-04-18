Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :dishes, only: [:show] do
    resources :ingredients, only: [:create], controller: 'dish_ingredients'
  end

  resources :chefs, only: [:show] do
    resources :ingredients, only: [:index], controller: 'chefs/ingredients'
  end
end
