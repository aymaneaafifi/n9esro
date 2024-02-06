
Rails.application.routes.draw do
  devise_for :users,
    controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks'
    }

  root to: "pages#home"
  resources "terrains", only:[:show,:index] do
    collection do
      get 'find_terrain_by_address'
    end
    resources "matches", only: [:index,:show]
  end
  resources "matches", only: [:new,:create]
  resources :users, only: [:show, :edit, :update]

end
