module ApplicationHelper
  def flash_message(msg_type)
    "<p class='#{msg_type}'>#{flash[msg_type]}</p>".html_safe
    # 長出來的內容
    # <p class="notice"><%= notice %></p>
    # <p class="alert"><%= alert %></p>
  end

  def delete_link_to(label, url)
    link_to label, url, class: 'destroy btn', method: 'delete', data: { confirm: '確認刪除?!'}
  end
end