Rails.application.routes.draw do

  root 'owners#index'
  resources :owners
  resources :cats
  
  # get 'owners/index'

  # get 'owners/show'

  # get 'owners/update'

  # get 'owners/new'

  # get 'cats/index'

  # get 'cats/show'

  # get 'cats/update'

  # get 'cats/new'

end
