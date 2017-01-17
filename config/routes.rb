Rails.application.routes.draw do
  root 'landing#index'
  get 'landing/index'

  resources :movies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope '/api' do
    scope '/v1' do

      scope '/movies' do
        get '/search' => 'movies#search'

      end
      resources :movies
    end
  end
end
