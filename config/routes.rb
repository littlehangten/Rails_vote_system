Rails.application.routes.draw do
  # 與下面路徑是一樣的意思
  # get '/', to: 'candidates#index'
  root 'candidates#index'

  resources :candidates
end
