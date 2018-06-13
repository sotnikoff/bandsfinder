Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  scope format: false do
    get 'profiles/:id', to: 'profiles#show', as: 'profile'

    devise_for :users, controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions'
    }

    resources :musicians, only: %i[show edit create update] do
      delete '/', action: 'destroy', on: :collection
    end

    resources :musician_skills, only: %i[create destroy]

    scope 'search' do
      get 'musicians', to: 'search#musicians', as: 'search_musicians'
      get 'bands', to: 'search#bands', as: 'search_bands'
    end

    scope 'band_requests' do
      post 'create', to: 'band_requests#create', as: 'band_requests_create'
      post ':id/approve', to: 'band_requests#approve', as: 'band_request_approve'
      post ':id/decline', to: 'band_requests#decline', as: 'band_request_decline'
      post ':id/revoke', to: 'band_requests#revoke', as: 'band_request_revoke'
    end

    resources :bands

    root 'pages#index'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
