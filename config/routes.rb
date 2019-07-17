Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products, only: [:index,:sales_document]
  get  'products/index',  to: 'products#index'
  get  'products/sales_document/',  to: 'products#sales_document'
  get 'customer_sales_documents/:id', to: 'customer_sales_documents#show', as: 'customer_sales_document'


  root 'products#index'
end
