Rails.application.routes.draw do
  root to: 'recipes#index'
  resources :recipes, only: [:new, :create, :show, :index, :edit, :update] do
    resources :doses, only: [:new, :create]
  end
    resources :doses, only: [:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
