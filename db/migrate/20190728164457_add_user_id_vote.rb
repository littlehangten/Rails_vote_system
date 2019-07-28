class AddUserIdVote < ActiveRecord::Migration[5.2]
  def change
    # add_column :votes, :user_id, :integer -> 乖乖牌寫法
    # add_column :votes, :user, :references -> 畫面爆掉
    add_reference :votes, :user, index: true
  end
end
