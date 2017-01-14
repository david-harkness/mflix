Rails.application.routes.draw do
  resources :movies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope '/api' do
    scope '/v1' do
      scope '/movies' do
        post '/search' => 'movies#search'
        get '/:id' => 'movies#show'
      end
    end
  end
end
