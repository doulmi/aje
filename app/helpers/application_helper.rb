module ApplicationHelper
  def full_title(page_title = '')
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      base_title
    else
      "#{page_title.upcase_first} | #{base_title}"
    end
  end

  def gravatar_for(user, options = {size: 80})
    size = options[:size]
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def get_type_text(type)
    if type == 'article'
      '文章'
    elsif type == 'activity'
      '活动'
    elsif type === 'page'
      '页面'
    end
  end

  def is_number
    true if Float(string) rescue false
  end

  def is_active_url(catid)
    catid == (params[:catid] || '本会章程') ? 'active' : ''
  end
end
