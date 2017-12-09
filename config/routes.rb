Rails.application.routes.draw do
  resources :topics, module: :molecule

  namespace :molecule do
    resources :topics
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'application#top'
end
