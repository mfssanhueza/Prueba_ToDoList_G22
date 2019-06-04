Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/todos', to: 'todos#index'
  get 'todos/new'
  post '/todos', to: 'todos#create'
  get 'todos/list'
  get '/todos/:id', to: 'todos#show', as: 'todo'
  get '/todos/:id/edit', to:'todos#edit', as: 'todos_edit'
  patch '/todos/:id', to: 'todos#update'
  delete 'todos/:id', to:'todos#destroy', as: 'todos_destroy'
  get '/todos/:id/complete', to: 'todos#complete', as: 'todos_complete'
end
