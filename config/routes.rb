Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace 'api' do
    post 'login_auth', to: 'v1/users#login_auth'
    post 'signup', to: 'v1/users#signup'

    namespace 'v1' do
      resources :posts
      resources :users
    end
  end

end