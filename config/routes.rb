Rails.application.routes.draw do
  get 'posts/show/:id', to: 'posts#show'

  get 'mypage/:id', to:'users#mypage'
  get 'edit/:id', to:'users#edit'
  post 'update/:id', to:'users#update'
  get 'signup', to:'users#new'
  post 'create', to: 'users#create'
  get 'login', to: 'users#login_form'
  post 'login', to: 'users#login'
  post 'logout', to: 'users#logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
