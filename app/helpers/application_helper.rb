module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Prietary"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

end

# allow sign in on other pages, from http://pupeno.com/2010/08/29/show-a-devise-log-in-form-in-another-page/
module ContentHelper
	puts "in ContentHelper"
  def resource_name
    puts "in resource_name"
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end