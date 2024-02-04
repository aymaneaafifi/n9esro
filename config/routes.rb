
Rails.application.routes.draw do
  devise_for :users,
    controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
    }

  root to: "pages#home"
  resources "terrains", only:[:show] do
    resources "matches", only: [:index,:show,:new,:create] do
      post 'join_team', on: :member
    end
  end
end
