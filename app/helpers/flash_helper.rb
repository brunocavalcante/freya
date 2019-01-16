module FlashHelper
  def flash_messages
    return if !flash

    flash.each do |k, v|
      concat content_tag :div, v.html_safe, class: "alert alert--app alert--#{k}"
    end
  end
end