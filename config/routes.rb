Rails.application.routes.draw do
  get 'show/:id', to: 'posts#show'
  get 'posts/new', to: 'posts#new_posts'
  post 'write', to: 'posts#write'
  get 'posts/edit/:id', to: 'posts#edit_posts'
  post 'posts/update/:id', to: 'posts#update_posts'
  get 'posts/delete/:id', to: 'posts#delete_posts'
  post 'delete/:id', to: 'posts#delete'

  get 'mypage/:id/:login_id', to:'users#mypage'
  get 'edit/:id', to:'users#edit'
  post 'update/:id', to:'users#update'
  get 'signup', to:'users#new'
  post 'create', to: 'users#create'
  get 'login', to: 'users#login_form'
  post 'login', to: 'users#login'
  post 'logout', to: 'users#logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
