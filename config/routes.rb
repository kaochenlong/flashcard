Rails.application.routes.draw do
  devise_for :users

  root "cards#index"

  resources :cards do
    member do
      post :like
    end

    resources :comments, shallow: true,
               except: [:index, :show, :new]
  end

  # resources :comments
end
