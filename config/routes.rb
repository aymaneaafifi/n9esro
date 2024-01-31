






Rails.application.routes.draw do
  devise_for :users

  root "post#index"
  resources "matches"
end
