Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :api do
    namespace :v1 do
      post 'search_repositories', to: 'search#search_repositories'
    end
  end

  resources :search, only: [:new, :create, :show]

  root 'search#new'
end
