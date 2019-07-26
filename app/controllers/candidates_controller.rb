class CandidatesController < ApplicationController
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
    @candidate = Candidate.find_by(id: params[:id]) 
    # select * from candidate where id =? SQL的語法
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
      flash[:notice] = '新增成功'
      redirect_to "/"
    else
      # render action: :new 的縮寫
      # render file: '../views/candidates/new.html.erb'
      # 我要去借 new 的template
      render :new
    end
  end

  # /candidates/1/edit -> routes 長的樣子 /candidate/:id/edit
  def edit
    @candidate = Candidate.find_by(id: params[:id])
  end

  # patch /candidates/2
  def update
    @candidate = Candidate.find_by(id: params[:id])

    if @candidate.update(candidate_params)
      flash[:notice] = "更新成功"
      redirect_to root_path
    else
      render :edit
    end
  end

  # delete /candidates/:id
  def destroy
    @candidate = Candidate.find_by(id: params[:id])
    @candidate.destroy
    flash[:notice] = "資料已刪除"
    redirect_to root_path
  end

  # private也是個方法
  private

  def candidate_params
    # 用實體變數接起來，用params去抓一群東西(姓名、黨派......)
    # "candidate"=>{"name"=>"111", "age"=>"111", "party"=>"111", "platform"=>"111"}
    # permit 是個清洗的方法
    candidate_params = params.require(:candidate).permit(:name, :age, :party, :platform)
  end
end