Rails.application.routes.draw do
  root to: 'home#month'
  match 'get_post', to: 'home#get_post', via: [:get, :post]
end
