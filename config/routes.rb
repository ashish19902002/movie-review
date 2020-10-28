Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => 'home#dashboard'
  resources :movies
  post "import_csv" => "home#import_csv"
  get "import_csv_form" => "home#import_csv_form"
end
