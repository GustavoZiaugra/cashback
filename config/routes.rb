Rails.application.routes.draw do

  namespace 'admin' do
    resources :offers
    post '/offers/:id/change_state', to: 'offers#change_state', as: 'update_offer_state'
  end

  namespace 'user' do
    resources :offers, only: [:index]
  end

  root :to => 'admin/offers#index'
end
