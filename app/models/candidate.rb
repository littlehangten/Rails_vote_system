class Candidate < ApplicationRecord
  # 加上驗證，名字必填。驗證名字這個欄位是存在。名字沒有寫時，按出送出就會錯了！
  validates :name, presence: true
end
