Rails.application.routes.draw do

  devise_for :users
  root "visitors#new"

  root to: "visitors#index"

  resources :visitors

end
