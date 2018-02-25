Rails.application.routes.draw do
  get '/' => 'tutorial#index'

  get '/tutorial/:id' => 'tutorial#view'

  get '/queue' => 'tutorial#queue'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
