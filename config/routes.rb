Rails.application.routes.draw do
  # devise_for :users
  root 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items do
    member do
      get "buy"
      get "pay"
    end
    # 商品と紐付けることができない
    # resources :purchases, only: [:index] do
    #   collection do
    #     get 'done', to: 'purchases#done'
    #   end
    # end
  end 
  resources :users, only: [:new, :index, :edit, :update] do
    collection do
      get 'logout'
      get 'credit_regist'
      get 'new1'
      get 'new2'
      get 'new3'
    end
    resources :items, only: [:new, :index, :show] do
    end
  end
  resources :cards, only: [:new, :create, :show, :destroy] do
  end
end
