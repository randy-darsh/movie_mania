Rails.application.routes.draw do
  resources :directors, only: [:new, :create, :show] do
    resources :movies, only: [:index, :create, :new]
  end

  resources :movies, except: [:create, :new]
end
