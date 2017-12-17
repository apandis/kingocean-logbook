Rails.application.routes.draw do

  root "visitors#new"

  resources :visitors

end
