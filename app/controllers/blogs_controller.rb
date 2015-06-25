class BlogsController < ApplicationController

  def index
    if params[:tag]
      blogs = WordTag.where(name: params[:tag]).first.blogs
    else
      str = params[:type_id] ? "category_id = #{params[:type_id]}" : ""
      blogs = Blog.where(str).order("id DESC")
    end
    @blogs = page_objs(blogs, 10)
  end
  
  def show
    @blog = Blog.find_by_id(params[:id])
    return render_alert "No This Blog" if !@blog
    udpate_show_times @blog
    @page_title = @blog.title
  end
  
  def comment
    @blog = Blog.find(params[:blog_id])
    return flash[:notice] = @notice = red_content(t(:comment_not_empty)) if params[:message].empty? || params[:message] =~ /href[=]*|\<script|http|www|\.c[omn]+/
    save_message({message: params[:message]}, @blog)
    @blog.save
  end
end
