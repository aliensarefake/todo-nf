Rails.application.routes.draw do
  root "todos#index"
  resources :todos
  patch '/todos/:id/toggle_done', to: 'todos#toggle_done', as: :toggle_done
end
