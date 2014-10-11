Rails.application.routes.draw do
  get 'events/create'
  get 'events/index'
  get 'events/destroy'

  get 'projects/:project_id/todos/:id/edit_status', to: 'todos#edit_status'
  patch 'projects/:project_id/todos/:id/change_limit_time', to: 'todos#change_limit_time'
  devise_for :users
  root 'welcome#index'

  resources :teams
  resources :projects do
    resources :todos do
      resources :comments
    end
  end
  resources :events

end
