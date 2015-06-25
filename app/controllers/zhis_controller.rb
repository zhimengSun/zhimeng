class ZhisController < ApplicationController
  def index
    @blogs = page_objs(Blog.order("created_at DESC"))
    @late_blogs = Blog.order("created_at DESC").limit(5)
    @photos = ImageDesc.avilable.order("created_at DESC").limit(4)
    @state = State.last
  end
  
  def about_me
    @blog = Blog.unscoped.first
  end
end
