module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-danger"> <button type="button"
    class="close" data-dismiss="alert">x</button>
      #{messages}
    </div>
    HTML

    html.html_safe
  end

  def bootstrap_class_for flash_type
    case flash_type
      #when "success"
      #  "alert-success"
      #when "error"
      #  "alert-danger"
      when "alert"
        "alert-danger"
      when "notice"
        "alert-success"
      else
        flash_type.to_s
    end
  end

  def registered_users
    return User.count
  end

  def recent_registered_users
    return User.where("created_at < ?", "1.week.ago").count
  end
end
