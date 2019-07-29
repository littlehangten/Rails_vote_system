Rails.application.routes.draw do
  devise_for :users
  # 與下面路徑是一樣的意思
  # get '/', to: 'candidates#index'
  root 'candidates#index'
  
  # 原本的寫法 -> 不夠直覺
  # get "/history", to: "candidates#history"
  # 比較好的寫法
  get "/history", to: "users#history"

  resources :candidates do
  # member 作法 -> 視為candidate的一部份
    member do
      patch :vote
    end
  end

  # /admin
  namespace :admin do
    root 'pages#index'

    resources :candidates
  end
end