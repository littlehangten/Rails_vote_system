class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # 透過 has_many 與 candidates 有關連(虛線)，但實際上要透過 votes 來查詢。
  has_many :votes
  has_many :candidates, through: :votes
end
