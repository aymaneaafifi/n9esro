
Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users

  root to: "pages#home"
  resources "matches"
  resources "terrains", only: [:index,:show,:new,:create]
end
