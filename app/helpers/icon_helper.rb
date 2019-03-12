module IconHelper
  def check_icon(checked, options = {})
    return if !checked
    options[:class] ||= ''
    options[:class] += ' icon--check icon--block-centered'
    image_tag 'icon-check.png', options
  end

  def edit_icon(text = 'Edit')
    content_tag :div, class: 'btn btn--transparent btn--nano btn--block' do
      content_tag :div, class: 'flexbox flexbox--vcentered' do
        concat content_tag :i, 'edit', class: 'material-icons icon icon--left icon--small'
        concat text
      end
    end
  end
end