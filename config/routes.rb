Rails.application.routes.draw do
  devise_for :users
  resources :animes do
    resources :reviews
  end
  root "animes#index"
end
