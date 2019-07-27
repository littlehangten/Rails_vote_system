class CandidatesController < ApplicationController
  # before_action(在action之前 做某件事情):是個類別方法
  # 舊專案(rails 4)可以看這樣的程式碼(以前的用法) before_filler :ind_candidate
  before_action :find_candidate, only: [:show, :edit, :update, :destroy, :vote]

  def index
    # 給一個變數(複數) = 找出所有候選人的列表
    @candidates = Candidate.all
  end
  
  # 如果要去資料庫撈東西時，controller 裡還是要寫 show 的 action 
  # http://localhost:3000/candidates/1 -> routes 長的樣子 /candidate/:id
  def show
    # 如果要給view使用的話 記得要加 @，如果不要的話 就不要@(區域變數)
    # @candidate = Candidate.where(id: params[:id]).last 這是比較笨的做法之一
    # @candidate = Candidate.find(params[:id]) 只能找id
    # @candidate = Candidate.find_by(id: params[:id]) 比較有彈性
    # 在 SQL的語法 select * from candidate where id =? 
  end

  def new
    # 要在controller上做完，不要在views上做事情
    @candidate = Candidate.new
  end

  # create是個沒有畫面的方法
  def create
    @candidate = Candidate.new(candidate_params)

    # 假如儲存成功時會轉到首頁
    if @candidate.save
      redirect_to root_path, notice: '新增成功' 
    else
      # render action: :new 的縮寫
      # render file: '../views/candidates/new.html.erb'
      # 我要去借 new 的template
      render :new
    end
  end

  # /candidates/1/edit -> routes 長的樣子 /candidate/:id/edit
  def edit
  end

  # patch /candidates/2
  def update

    if @candidate.update(candidate_params)
      redirect_to root_path, notice: '更新成功'
    else
      render :edit
    end
  end

  # delete /candidates/:id
  def destroy
    @candidate.destroy
    redirect_to root_path, notice: '資料已刪除'
  end
  
  def vote
    # 會動但比較醜的寫法
    @candidate.vote = @candidate.vote + 1
    @candidate.save
    redirect_to root_path, notice: '投票完成'
  end

  # private也是個方法
  private
  
  # 重複的程式碼 寫成方法 可重複使用。
  def find_candidate
    @candidate = Candidate.find_by(id: params[:id])
  end

  def candidate_params
    # 用實體變數接起來，用params去抓一群東西(姓名、黨派......)
    # "candidate"=>{"name"=>"111", "age"=>"111", "party"=>"111", "platform"=>"111"}
    # permit 是個清洗的方法
    candidate_params = params.require(:candidate).permit(:name, :age, :party, :platform)
  end
end