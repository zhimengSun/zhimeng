class ZhisController < ApplicationController
  def index
    @blogs = page_objs(Blog.order("created_at DESC"))
    get_common
  end
  
  def about_me
    @blog = Blog.unscoped.first
  end

  def search
    get_common 
    @k = params[:k]
    @blogs = page_objs(Blog.where("content like '%#{@k}%' or title like '%#{@k}%'"))
    render :index
  end

  private
    def get_common
      @late_blogs = Blog.order("created_at DESC").limit(5)
      @photos = ImageDesc.avilable.order("created_at DESC").limit(4)
      @state = State.last
    end
end
