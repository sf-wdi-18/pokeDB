Rails.application.routes.draw do
  resources :pokemons, only: [:index, :show, :create, :update, :destroy]
  get '/*', to: 'application#catch_all'
end
