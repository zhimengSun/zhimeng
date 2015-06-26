class SongsController < ApplicationController
    
  def index
    @songs = Song.me
    @song = Song.find_by_id(params[:id]) || Song.last
    @page_title = "#{@song.name} - #{t(:szm)}"
    render "index"
  end
  
  def show
    index
    udpate_show_times @song
  end
end
