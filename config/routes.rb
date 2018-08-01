Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :cover_images do
    collection do
      get :active
    end
  end
  resources :winners, only: [:index, :create]
  resources :points do
    collection do 
      get :chart_data
    end
  end
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
