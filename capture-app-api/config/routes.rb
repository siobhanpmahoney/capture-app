Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users
      resources :categories
      resources :bookmarks
      resources :notes
      resources :industries
      resources :jobs
      resources :companies

      get '/users/:id/jobs', to: 'users#user_jobs', as: 'user_jobs'
      get '/users/:id/jobs', to: 'user#add_jobs'
      post '/users/:id/jobs', to: 'users#add_jobs'
      delete '/users/:id/jobs/:job_id', to: 'users#destroy_user_job'
      get '/users/:id/jobs/:job_id', to: 'users#user_job'
      patch '/users/:id/jobs/:job_id', to: 'users#update_job'

      get '/users/:id/companies', to: 'users#user_companies'
      get '/users/:id/companies/:company_id', to: 'users#user_company'

      get '/users/:id/notes', to: 'user#user_notes'
      # get '/users/:id/notes', to: 'user#add_notes'
      post '/users/:id/notes', to: 'users#add_notes'





      get '/users/:id/notes_and_bookmarks', to: 'users#notes_and_bookmarks'

      post '/login', to: 'auth#login'
      get '/current_user', to: 'auth#currentUser'
      post '/signup', to: 'auth#signup'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
