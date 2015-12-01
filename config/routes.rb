Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vn/ do
    root             "static_pages#home"
    get "home"    => "static_pages#home"
    get "about"   => "static_pages#about"
    get "contact" => "static_pages#contact"

    namespace :admin do
      root "categories#index"
      resources :categories
    end

    devise_for :users, controllers: {registrations: "registrations"}
    resources :users
    resources :categories, only: [:index]
  end
end
