class Song < ActiveRecord::Base
  belongs_to :singer
  scope :uncolsed, -> {where("type_id != 18")}
  
  def desc
    desc_zh_CN 
  end

  def pictures
    pics = Picture.where(bean: 'Song', bean_id: self.id)
  end
  
  def path
    "/system/Songs/#{self.id}.mp3"
  end

  def closed?
    type_id == 18
  end
  
  def type
    ModuleType.find_by_id(self.type_id).try(:name)
  end
  
  class << self
    def me
      where("type_id != 18").order("sing_time DESC")
    end

    def default
       where(is_default: true).last
    end
  end
end
