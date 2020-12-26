Rails.application.routes.draw do
  devise_for :users

  root "cards#index"

  resources :cards do
    member do
      post :like  # /cards/2/like
    end

    collection do
      get :import  # /cards/import
      get :search  # /cards/search
    end

    resources :comments, shallow: true,
               except: [:index, :show, :new]
  end

  # resources :comments
end
