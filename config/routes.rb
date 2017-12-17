Rails.application.routes.draw do

  resources :invoices, only: [:index, :show, :create, :update, :destroy]

end
