Rails.application.routes.draw do
  root "cards#index"

  resources :cards do
    resources :comments, shallow: true,
               except: [:index, :show, :new]
  end

  # resources :comments
end
