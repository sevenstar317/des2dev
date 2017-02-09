Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'

  scope path: '/pages', controller: 'pages' do
    get 'workspace'
    get 'workspace_project'
    get 'developer'
    get 'designers'
  end

  resources :ideas do
    scope module: 'ideas' do
      resources :pricings,  only: [:index, :create]
      resources :briefs,    only: [:index, :create]
      resources :overviews, only: [:index, :create]
      resources :billings,  only: [:index, :create]
      resources :payments,  only: [:index, :create]
    end
  end

  resources :images
  resources :projects

end
