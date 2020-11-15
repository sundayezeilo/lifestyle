module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = 'Lifestyle Articles Website'
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def get_alert_type(message_type)
    (message_type == 'notice') || (message_type == 'success') ? 'success' : 'danger'
  end  
end
