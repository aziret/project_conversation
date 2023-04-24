Rails.application.routes.draw do
  resources :projects do
    resources :project_histories, only: [:create, :new]
  end
  resources :comments
  resources :statuses
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "projects#index"
end
