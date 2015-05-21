Rails.application.routes.draw do

  #mms: Recommend only nesting one level deep
  #  from what I saw, I don't think your controller code would change
  #  see: http://guides.rubyonrails.org/routing.html#nested-resources
  #  Since you are always using current_user, you don't need user in your routes at all
  #  resources :tournaments
  #
  #  resources :tournaments do
  #    resources :games
  #  end

  resources :users do
    resources :tournaments do
    	resources :games
    end
  end

  resources :sessions, only: [:new, :create]

  root :to => 'tournaments#index'

  # hand-rolled auth? respect
  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  get '/users/:id', to: 'tournaments#index'
  delete '/signout', to: 'sessions#destroy'

end
