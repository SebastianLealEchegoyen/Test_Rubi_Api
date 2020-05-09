Rails.application.routes.draw do
  
  namespace 'api' do
    namespace 'v1' do
      resources :tasks
      resources :users, only: [:create,:index] do
        collection do
          post 'login'
        end
    end
  end
end
end
