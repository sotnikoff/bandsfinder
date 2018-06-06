Rails.application.routes.draw do
  get 'band_requests/approve'
  get 'band_requests/decline'
  get 'band_requests/revoke'
  scope format: false do
    get 'profiles/:id', to: 'profiles#show', as: 'profile'
    devise_for :users
    resources :musicians, only: %i[show edit create update] do
      delete '/', action: 'destroy', on: :collection
    end

    scope 'band_requests' do
      post 'create', to: 'band_requests#create'
      post ':id/approve', to: 'band_requests#approve'
      post ':id/decline', to: 'band_requests#decline'
      post ':id/revoke', to: 'band_requests#revoke'
    end
    resources :bands
    root 'pages#index'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
