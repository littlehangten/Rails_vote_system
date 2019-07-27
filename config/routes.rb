Rails.application.routes.draw do
  # 與下面路徑是一樣的意思
  # get '/', to: 'candidates#index'
  root 'candidates#index'

  resources :candidates do
  # member 作法 -> 視為candidate的一部份
    member do
      patch :vote
    end
  end
end