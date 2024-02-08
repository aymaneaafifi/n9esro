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
  resources "terrains" do
    resources "matches", only: [:index,:show,:new,:create] do
      post 'join_team', on: :member
    end
  end
  resources "user_team", only: [:create, :update, :destroy]
end
