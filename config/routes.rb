






Rails.application.routes.draw do
  devise_for :users

  root "post#index"
  resources "matches" do
    resouces "terrains", only: [:index,:show,:new,:create]
  end
end
