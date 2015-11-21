Rails.application.routes.draw do
  get 'messages/new'

  root to: 'visitors#index'
end
