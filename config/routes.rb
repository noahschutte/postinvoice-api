Rails.application.routes.draw do

  resources :invoices, only: [:index, :show, :create, :destroy]
  resources :reports, only: [:index]

end
