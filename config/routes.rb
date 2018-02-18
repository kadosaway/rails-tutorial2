Rails.application.routes.draw do
  resources :topics, module: :molecule do
    resources :comments, shallow: true
  end

  resources :logins, module: :molecule

  namespace :molecule do
    resources :topics
    resources :comments
    resources :logins
    resources :cals do
      resources :events, only: %i(show edit update destroy), shallow: true
      member do
        get ':day' => :day, as: :day
        get ':day/new' => 'events#new', as: :new_event
        post ':day/new' => 'events#create'
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'application#top'
end
