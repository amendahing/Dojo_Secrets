Rails.application.routes.draw do
  get 'users/new'

  post 'users/create'

  get 'users/show'

  get 'users/:id' => 'users#show'

  get 'users/:id/edit' => 'users#edit'

  get 'users/index'

  patch 'users/:id/update' => 'users#update'

  delete 'users/:id' => 'users#destroy'

  get 'sessions/new'

  post 'login' => 'sessions#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
