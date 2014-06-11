Prietary::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users, 
             :controllers => { :registrations => "my_devise/registrations", 
                              :invitations => 'my_devise/invitations' }  # this is only for custom controller
             # :controllers => { :registrations => "devise/my_devise/registrations" } #this was causing error:
  resources :users
  resources :projects
  resources :ideas
  resources :votes
  resources :jobs
  resources :feedbacks
  resources :attributes
  resources :companies
  resources :pattributes
  resources :pfeedbacks
  resources :fbvotes
  resources :thanks
  resources :asks
  resources :flags
  #resources :invitations

  # from BUv2
  #root 'users#home'  # caused an error
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/howitworks',   to: 'static_pages#howitworks',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/leaderboard', to: 'static_pages#leaderboard', via: 'get'  
  match '/give_feedback', to: 'feedbacks#give_feedback', via: 'get'
  match 'feedbacks/complete/:id', to: 'feedbacks#complete', via: 'post' 
  # match 'feedbacks/slider_complete/:id', to: 'feedbacks#slider_complete', via: 'post' 
  # match 'pfeedbacks/pslider_complete/:id', to: 'pfeedbacks#pslider_complete', via: 'post'

  match 'create_colleague', to: 'users#create_colleague' 

  match '/myfeedback', to: 'users#myfeedback',  via: 'get'
  match '/newproject', to: 'projects#new',      via: 'get'  # I think this is wrong
  #match '/newproject', to: 'projects#new',      via: 'post'  # improve this
  match '/projects', to: 'projects#index',      via: 'get'  # I think if resources :projects is working, I shouldn't need this

  # this takes me to a page, but I need to flash a message and add the project
  match '/projects', to: 'projects#index',      via: 'post'  # was getting "No route matches [POST] "/projects""
  
  match '/project', to: 'projects#index',       via: 'get'  # added in BUv1 because route for project was not found
  match '/projects/:id', to: 'projects#show',   via: 'get'  # I think if resources :projects is working, I shouldn't need this
  match '/projects/edit/:id', to: 'projects#edit', via: 'post'   # ???

  #get "static_pages/home"  
  get "users/home"
  #get "static_pages/help"
  #get "static_pages/about" 
  #get "static_pages/contact" 


end

# # reources :users    gives:
# GET /users  index users_path  page to list all users
# GET /users/1  show  user_path(user) page to show user
# GET /users/new  new new_user_path page to make a new user (signup)
# POST  /users  create  users_path  create a new user
# GET /users/1/edit edit  edit_user_path(user)  page to edit user with id 1
# PATCH /users/1  update  user_path(user) update user
# DELETE  /users/1  destroy user_path(user) delete user