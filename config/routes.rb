Rails.application.routes.draw do
  resources :cover_images do
    collection do
      get :active
    end
  end
  resources :winners, only: [:index, :create]
  resources :points
  resources :words do 
    member do 
    end
  end
  resources :people do
    member do 
    end
    collection do
      get :ranking
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
