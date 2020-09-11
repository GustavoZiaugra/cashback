Rails.application.routes.draw do

  namespace 'admin' do
    resources :offers
    post '/offers/:id/change_state', to: 'offers#change_state', as: 'update_offer_state'
  end

  root :to => 'admin/offers#index'
end
