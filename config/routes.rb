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
    resources :orders, only: [ :show, :update]
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
   
    resources :items,only: [:index,:show]


    

    resources :addresses,only: [:index,:create,:edit,:update,:destroy]

    resources :items,only: [:index,:show]

     resources :cart_items,only: [:index,:update,:create,:destroy] do
        collection do
          delete '/' => 'cart_items#all_destroy'
      end
    end

    resources :orders,only: [:new,:index,:show,:create] do
      collection do
        post 'log'
        get 'thanx'
      end
    end




    resources :customers, only: [:show, :edit, :update]

    resources :cart_items,only: [:index,:update,:create,:destroy] do
        collection do
          delete '/' => 'cart_items#all_destroy'
        end







  end

end
end
