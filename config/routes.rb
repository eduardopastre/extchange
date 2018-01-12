Rails.application.routes.draw do
  root 'home#index'
  post 'extchange', to: "home#exchange"
end
