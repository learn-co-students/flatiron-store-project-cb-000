module ApplicationHelper
  def nav_link(text, path, method = nil)
    content_tag(:li, class: 'nav-item') do
      link_to text, path, class: 'nav-link', method: method
    end
  end
end
