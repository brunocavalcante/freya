module ChangelogHelper
  def changelog(object)
    return if !object.respond_to?(:versions)
    data = changelog_data(object.versions)

    capture do 
      content_tag :div, class: 'section section--top-margin-big' do 
        concat content_tag :h4, I18n.t(:title, scope: 'freya.changelog'), class: 'subtitle subtitle--small no-bottom-margin'
        concat content_tag :ol, changelog_items(data), class: 'changelog'
      end
    end
  end

  def changelog_data(versions)
    data = []
    user_ids = []
    users_hash = {}
    
    versions.reorder('created_at DESC').limit(25).each { |v| data << { version: v, user: nil }; user_ids << v.whodunnit }
    User.where(id: user_ids).select(:id, :name).each { |u| users_hash[u.id] = u }
    data.each { |d| d[:user] = users_hash[d[:version].whodunnit.to_i] }

    data
  end

  def changelog_items(data)
    capture do 
      data.each { |d| concat content_tag :li, link_to(changelog_item(d), '#', class: 'changelog__item') }
    end
  end

  def changelog_item(d)
    label_class = case d[:version].event
      when 'create' then 'tag--green'
      when 'update' then 'tag--discrete'
      when 'destroy' then 'tag--red'
    end

    capture do 
      concat content_tag :i, 'add_circle_outline', class: 'material-icons changelog__open'
      concat content_tag :i, 'remove_circle_outline', class: 'material-icons changelog__hide'
      concat I18n.l(d[:version].created_at, format: :short)
      concat ' &middot; '.html_safe
      concat d[:user] && d[:user].name ? d[:user].name : '👻'
      concat ' &middot; '.html_safe
      concat content_tag :span, d[:version].event, class: "tag tag--mini #{label_class}" 

      concat content_tag :div, changelog_details(d[:version]), class: 'changelog__details'
    end
  end

  def changelog_details(version)
    return 'Nothing to show here, sorry! :)' if !version.object_changes

    capture do 
      version.object_changes.each do |oc|
        next if ['updated_at'].include?(oc.first)

        change = "<b>#{oc.first}</b>: #{oc.last.first} &rarr; #{oc.last.last}"
        concat content_tag :div, change.html_safe, class: 'changelog__change'
      end
    end
  end
end