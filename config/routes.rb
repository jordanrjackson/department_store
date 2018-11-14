Rails.application.routes.draw do
  root "subs#index"

  resources :subs do
    resources :topics
  end

  resources :topics do
    resources :items
  end

end