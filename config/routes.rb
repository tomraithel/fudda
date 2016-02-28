Rails.application.routes.draw do
  resources :meals, except: [:show]
  get '/meals/ingredients', to: 'meals#ingredients'

  resources :products, except: [:show]
  post '/products/reorder', to: 'products#reorder', as: 'products_reorder'

  resources :receipes do
    resources :ingredients, except: [:show, :index, :edit]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  root 'welcome#index'
end
