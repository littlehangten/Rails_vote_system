namespace :db do
  desc "更新投票數"
  task :update_vote => :environment do 
    print "開始！"
    Candidate.all.each do |candidate|
        Candidate.reset_counters(candidate.id, :votes)
        print "."
      end
      puts "完成！"
    end
end

# :environment 環境變數
# 把所有候選人用迴圈的方式用reset_counters來更新
# 在 rails c 下這個語法 -> rails db:update_vote