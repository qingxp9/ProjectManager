Rails.application.routes.draw do
  get 'projects/:project_id/todos/:id/edit_status', to: 'todos#edit_status'
  patch 'projects/:project_id/todos/:id/change_limit_time', to: 'todos#change_limit_time'
  get 'events', to: 'events#index'
  devise_for :users
  root 'welcome#index'

  resources :teams
  resources :projects do
    resources :todos do
      resources :comments, only: [:create, :destroy]
    end
  end
  resources :accesses, only: [:create, :new, :update, :destroy, :edit]

end
