Rails.application.routes.draw do

  resources :invoices, only: [:index, :show, :create, :destroy]
  resources :inventory_sheets, only: [:index, :show, :create, :destroy]
  resources :reports, only: [:index, :show, :create, :destroy]
  resources :vendors, only: [:index]
  resources :codes, only: [:index]

end
