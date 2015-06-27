class BlogsController < ApplicationController

  def tag
    tg = WordTag.where(name: params[:tag]).first
    @blogs = page_objs(tg ? tg.blogs : [])
    render "zhis/index"
  end
  
  def show
    @blog = Blog.find_by_id(params[:id])
    return @error = "No This Blog" if !@blog
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
