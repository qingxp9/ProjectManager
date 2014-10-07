Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  resources :projects do
    resources :todos do
      resources :comments
    end
  end

end
