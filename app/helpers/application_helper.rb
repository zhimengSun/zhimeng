module ApplicationHelper

  def active_menu(boo)
    boo ? "am-active" : ""
  end

  def short_blog(blog, num = 500, keep_span = true)
    (blog.content.gsub(/<[^>]*>/, "")[0, num] +
    "<a href='/blogs/#{blog.id}' target='_blank'><font color='#FF9900'><font size='2'>&lt;#{t(:reading_more)}&gt;</font></font></a>").html_safe
  end
end
