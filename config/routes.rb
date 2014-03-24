Rails3MongoidDevise::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users

  # from BUv2
  #root 'users#home'  # caused an error
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/leaderboard', to: 'static_pages#leaderboard', via: 'get'  
  match '/give_feedback', to: 'feedbacks#give_feedback', via: 'get'
  match 'feedbacks/complete/:id', to: 'feedbacks#complete', via: 'post' 
  match 'feedbacks/slider_complete/:id', to: 'feedbacks#slider_complete', via: 'post' 
  match '/myfeedback', to: 'users#myfeedback',  via: 'get'
  match '/newproject', to: 'projects#new',      via: 'post'  # improve this
  match '/projects', to: 'projects#index',      via: 'get'  # I think if resources :projects is working, I shouldn't need this

  # this takes me to a page, but I need to flash a message and add the project
  match '/projects', to: 'projects#index',      via: 'post'  # was getting "No route matches [POST] "/projects""
  
  match '/project', to: 'projects#index',       via: 'get'  # added in BUv1 because route for project was not found
  match '/projects/:id', to: 'projects#show',   via: 'get'  # I think if resources :projects is working, I shouldn't need this

  #get "static_pages/home"  
  get "users/home"
  get "static_pages/help"
  get "static_pages/about" 
  get "static_pages/contact" 


end