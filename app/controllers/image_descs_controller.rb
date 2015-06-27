class ImageDescsController < ApplicationController
    
  def index
    @image_descs = ImageDesc.avilable
    @image_desc = ImageDesc.find_by_id(params[:id]) || ImageDesc.last
    @page_title = "#{@image_desc.desc} - #{t(:szm)}"
    render "index"
  end
  
  def show
    index
    udpate_show_times @image_desc
  end
end
