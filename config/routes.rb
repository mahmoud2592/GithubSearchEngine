Rails.application.routes.draw do
  get 'sorting_options/index'
  get 'sorting_options/show'
  get 'filter_values/index'
  get 'filter_values/show'
  get 'filters/index'
  get 'filters/show'
  get 'search_terms/index'
  get 'search_terms/show'
  get 'searches/create'
  get 'searches/index'
  get 'searches/show'
  get 'sorting_options/show'
  get 'filter_values/show'
  get 'filters/show'
  get 'search_terms/show'
  get 'tags/index'
  get 'tags/show'
  get 'languages/index'
  get 'languages/show'
  get 'commits/index'
  get 'commits/show'
  get 'repositories/index'
  get 'repositories/show'
  get 'users/index'
  get 'users/show'

  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
