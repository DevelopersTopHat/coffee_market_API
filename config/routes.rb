Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      resources :products
      get '/in_stock', controller: 'products', action: 'in_stock' 
      put '/purchase/:id', controller: 'products', action: 'purchase' 
    end
  end  
end
