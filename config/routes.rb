
Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users

  root to: "pages#home"
  resources "matches"do
     resouces "terrains", only: [:index,:show,:new,:create]
end
end
