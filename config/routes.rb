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
  resources :items, only: [:new, :create, :show, :edit, :update] do
    collection do
      get 'search'
    end
  end
  resources :farms, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :favorites, only: [:create, :destroy]
  end
  resources :users, only: :show
  resources :tags, only: :show
end
