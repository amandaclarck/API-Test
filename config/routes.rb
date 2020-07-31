Rails.application.routes.draw do
  namespace :api do
    resources :disciplines, only: [:index]
  end

  namespace :api, defaults: {format: :json}  do
    post "/questions/filter/" => "questions#filter"
  end
end
