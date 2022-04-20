Rails.application.routes.draw do
  root to: 'home#index' # これは home#index を root に割り当てる定義
  match 'get_post', to: 'home#get_post', via: [:get, :post]
end
