module UsersHelper
  def display_user(user)
    return if !user
    concat user_avatar(user, 'avatar--small')
    concat content_tag(:span, user, class: 'avatar__username', title: user)
  end

  def user_avatar(user, klasses = "")
    initials = user_initials(user)
    avatar_color = user_avatar_color(user)
    content_tag(:span, initials, class: "avatar avatar--letter #{klasses} #{avatar_color}", title: user)    
  end

  def user_initials(user)
    name = user.has_attribute?(:name) ? user.name : user.to_s
    names = name.split(' ')
    (names.size > 1 ? (names.first[0] + names.last[0]) : names.first).upcase
  end

  def user_avatar_color(user)
    color = case user.id % 5
    when 1 then 'avatar--letter--brown'
    when 2 then 'avatar--letter--green'
    when 3 then 'avatar--letter--blue'
    when 4 then 'avatar--letter--grey'
    end
  end
end