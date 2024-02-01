
Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users,
    controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
    }

  root to: "pages#home"
  resources "matches"
  resources "terrains", only: [:index,:show,:new,:create]
end
