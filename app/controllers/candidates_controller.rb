class CandidatesController < ApplicationController
  def index
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
  
  # private也是個方法
  private

  def candidate_params
    # 用實體變數接起來，用params去抓一群東西(姓名、黨派......)
    # "candidate"=>{"name"=>"111", "age"=>"111", "party"=>"111", "platform"=>"111"}
    # permit 是個清洗的方法
    candidate_params = params.require(:candidate).permit(:name, :age, :party, :platform)
  end
end