Rails.application.routes.draw do
  resources :articles, only: [:index, :create]
  resources :tags, only: [:show]
end
