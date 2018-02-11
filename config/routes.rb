Rails.application.routes.draw do
  resources :points
  resources :words
  resources :people do
    collection do
      get :ranking
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
