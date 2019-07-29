class UsersController < ApplicationController
  # Devise使用的before_action，怎麼使用：看文件。
  before_action :authenticate_user!
  def history
  end
end
