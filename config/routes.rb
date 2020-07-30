Rails.application.routes.draw do
  namespace :api do
    resources :disciplines, only: [:index]
  end
  # get "/disciplines", to: "/api/disciplines#index", as: "disciplines"
  # post "/questions/:params_date", to: "/api/questions#index", as: "questions"
end
