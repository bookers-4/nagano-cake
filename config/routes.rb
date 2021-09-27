Rails.application.routes.draw do



   #管理者ルーティング

 devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    namespace :admin do
    root to: "homes#top"
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]

    end


  #会員側ルーティング

  devise_for :customers, :controllers => {
    :sessions => 'customers/sessions',
    :registrations => 'customers/registrations',
    :passwords => 'customers/passwords'
   }


    scope module: :customer do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get 'search/search'
    resources :items,only: [:index,:show]


    get "customers/unsubscribe" => "customers#unsubscribe"
    patch "customers/withdraw" => "customers#withdraw"  
    #仮追加
    


    resources :addresses,only: [:index,:create,:edit,:update,:destroy]

    resources :items,only: [:index,:show]

     resources :cart_items,only: [:index,:update,:create,:destroy] do
        collection do
          delete '/' => 'cart_items#all_destroy'
      end
    end

    get 'orders/about' => 'orders#about'
    get 'orders/complete' => 'orders#complete'


    resources :orders,only: [:index,:show,:create]

    post 'orders/new' => 'orders#new'
    post 'orders/log' => 'orders#log'
    get 'orders/thanks' => 'orders#thanks'

    resources :customers, only: [:show, :edit, :update]


  end

end

