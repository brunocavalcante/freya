module ChangelogHelper
  def changelog(object)
    return if !object.respond_to?(:versions)
    data = changelog_data(object.versions)

    capture do 
      concat content_tag :h4, I18n.t(:title, scope: 'freya.changelog'), class: 'subtitle subtitle--small'
      concat content_tag :ol, changelog_items(data), class: 'list'
    end
  end

  def changelog_data(versions)
    data = []
    user_ids = []
    users_hash = {}
    
    versions.each { |v| data << { version: v, user: nil }; user_ids << v.whodunnit }
    User.where(id: user_ids).select(:id, :name).each { |u| users_hash[u.id] = u }
    data.each { |d| d[:user] = users_hash[d[:version].whodunnit.to_i] }

    data
  end

  def changelog_items(data)
    capture do 
      data.each { |d| concat content_tag :li, changelog_item(d), class: 'changelog__item' }
    end
  end

  def changelog_item(d)
    capture do 
      concat I18n.l(d[:version].created_at, format: :short)
      concat ' &middot; '.html_safe
      concat d[:user].name
      concat ' &middot; '.html_safe
      concat d[:version].event
    end
  end
end