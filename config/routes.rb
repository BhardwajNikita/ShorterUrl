Rails.application.routes.draw do
  resources :links, only: [:new, :create]
  get '/stats', to: 'links#index', as: :stats
  get '/:slug', to: 'links#show', as: :show
  root "links#new"
end
