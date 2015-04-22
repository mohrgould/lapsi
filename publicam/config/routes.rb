require 'api_constraints'

Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :cameras do
        resources :frames, shallow: true
      end
      post 'cameras/:camera_id/frames/submit', to: 'frames#submit'
    end
  end

  get 'log_in' => 'sessions#new', as: 'log_in'
  get 'log_out' => 'sessions#destroy', as: 'log_out'
  get 'sign_up' => 'users#new', as: 'sign_up'

  resources :users do
    resources :api_keys, shallow: true
  end

  resources :sessions
  resources :cameras do
    resources :frames, shallow: true
  end

  get 'welcome/index'
  
  root 'welcome#index'
end
