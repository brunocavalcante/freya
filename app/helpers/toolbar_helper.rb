module ToolbarHelper
  def new_link_to(url, name = I18n.t(:create, scope: 'freya.toolbar'), options = {})
    link_to url, class: 'btn btn--iconable' do 
      content_tag :div, class: 'flexbox flexbox--vcentered' do
        concat content_tag :i, 'add', class: 'material-icons icon icon--left flexbox__fixed'
        concat name
      end
    end
  end

  def edit_link(url, name, options = {})
    link_to url, class: 'btn btn--edit btn--iconable btn--nano', method: :get do 
      content_tag :div, class: 'flexbox flexbox--vcentered' do
        concat content_tag :i, 'edit', class: 'material-icons icon icon--left flexbox__fixed'
        concat name
      end
    end
  end

  def destroy_link(url, name, options = {})
    link_to url, class: 'btn btn--destroy btn--iconable btn--nano', method: :delete, data: { confirm: I18n.t(:delete_confirm, scope: 'freya.toolbar') } do 
      content_tag :div, class: 'flexbox flexbox--vcentered' do
        concat content_tag :i, 'delete', class: 'material-icons icon icon--left flexbox__fixed'
        concat name
      end
    end
  end

  def destroy_block(url, name, options = {})
    options[:class] ||= ''
    options[:class] += ' btn--nano'
    content_tag :div, class: 'destroy-block' do 
      concat content_tag :p, 'Not happy with this object?', class: 'paragraph--small'
      concat destroy_link url, name, options
    end
  end
end