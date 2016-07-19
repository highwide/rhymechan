Rails.application.routes.draw do
  resources :messages
  root 'texts#index'
end
