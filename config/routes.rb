Rails.application.routes.draw do
  scope format: false do
    get 'profiles/:id', to: 'profiles#show', as: 'profile'
    devise_for :users
    resources :musicians, only: %i[show edit create update] do
      delete '/', action: 'destroy', on: :collection
    end
    root 'pages#index'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
