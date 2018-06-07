Rails.application.routes.draw do
  scope format: false do
    get 'profiles/:id', to: 'profiles#show', as: 'profile'
    devise_for :users
    resources :musicians, only: %i[show edit create update] do
      delete '/', action: 'destroy', on: :collection
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
