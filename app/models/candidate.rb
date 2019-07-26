class Candidate < ApplicationRecord
  # 加上驗證，名字必填。驗證名字這個欄位是存在。名字沒有寫時，按出送出就會錯了！
  validates :name, presence: true
  # 驗證年紀必填。
  validates :age, numericality: { greater_than_or_equal_to: 40 }
end
