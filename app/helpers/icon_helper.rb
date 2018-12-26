module IconHelper
  def check_icon(checked)
    return if !checked
    content_tag :i, 'done', class: 'material-icons check-icon'
  end
end