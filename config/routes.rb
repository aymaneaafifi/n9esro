Rails.application.routes.draw do

  get '/users/sign_up', to: redirect('/404')  # Redirect to a 404 page or any other desired page

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'registrations'
  }

  devise_scope :user do
    get 'complete_information', to: 'registrations#complete_information'
  end
  root to: "pages#home"

  resources "terrains", only:[:show,:index] do
    collection do
      get 'find_terrain_by_address'
    end
    resources "matches", only: [:index,:show] do
      post 'join_team', on: :member
    end

  end 
  resources "user_team", only: [:create, :update, :destroy]
  resources "matches", only: [:new,:create]
  resources :users, only: [:show, :edit, :update]

end
