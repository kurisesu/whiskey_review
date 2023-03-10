Rails.application.routes.draw do
# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
    root to: 'homes#top'
    resources :reviews, only: [:index, :new, :show, :edit, :update, :create, :destroy]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :sessions, only: [:new, :create, :destroy,]
    resources :homes, only: [:update]

    resources :tags do
    get 'reviews', to: 'reviews#search'
  end
  end

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'

    post '/customers/gest/sign_in' => 'homes#guest'

    resources :genres,only:[:index,:show]
    get "search" => "reviews#search"


    get 'customers/my_page' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/information' => 'customers#update'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'
    resources :reviews, only: [:index, :show,] do
    resources :comments,only:[:new,:create, :update, :destroy]
  end



  end
end


