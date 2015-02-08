Rails.application.routes.draw do  

  resources :vendors

  devise_for :users
  resources :movies do
    collection do
      get 'search' => 'movies#search'
    end
    resources :reviews, except: [:show, :index]
  end
  root 'movies#index'

end
