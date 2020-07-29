Rails.application.routes.draw do
  get "/disciplines/index", to: "disciplines#index", as: "disciplines"
  post "/questions/:params_date", to: "questions#index", as: "questions"
end
