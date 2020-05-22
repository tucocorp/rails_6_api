Rails.application.routes.draw do
  apipie
  namespace :api, defaults: { format: :json }  do
    namespace :v1 do
      root 'welcome#status'
      post 'auth/login', to: 'authentication#authenticate'
      post 'signup', to: 'users#create'
    end
  end
end
