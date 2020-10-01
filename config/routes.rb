Rails.application.routes.draw do
  devise_for :farmers, controllers: {
    sessions:      'farmers/sessions',
    passwords:     'farmers/passwords',
    registrations: 'farmers/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  root to: 'items#index'
  resources :items do
    collection do
      get 'search'
    end
    resources :orders, only: [:index, :new, :create]
  end
  resources :farms, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :favorites, only: [:create, :destroy]
    resources :tweets, only: [:index, :new, :create, :edit, :update, :destroy]
  end
  resources :users, only: :show
  resources :tags, only: :show
  resources :rooms, only: [:index, :new, :create, :show, :destroy] do
    resources :messages, only: :create
  end
end
