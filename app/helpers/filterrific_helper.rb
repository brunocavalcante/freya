module FilterrificHelper
  def filterrific_buttons
    button_tag class: 'btn btn--discrete btn--iconable' do 
      content_tag :div, class: 'flexbox flexbox--vcentered' do
        concat content_tag :i, 'search', class: 'icon icon--left material-icons'
        concat 'Search'
      end
    end
  end
end