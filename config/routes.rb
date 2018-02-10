Rails.application.routes.draw do
  resources :topics, module: :molecule do
    resources :comments, shallow: true
  end

  resources :cals, module: :molecule
  get 'cals/:id/:day' => 'molecule/cals#day'

  resources :logins, module: :molecule

  namespace :molecule do
    resources :topics
    resources :comments
    resources :logins
    resources :cals
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'application#top'
end
