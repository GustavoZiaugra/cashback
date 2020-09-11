Rails.application.routes.draw do
  resources :offers

  root :to => 'offers#index'

  post '/offers/:id/change_state', to: 'offers#change_state', as: 'update_offer_state'
end
