class Singer < ActiveRecord::Base
  has_many :songs

  def picture
    "/system/Singers/#{self.id}.jpg"
  end
  
end
