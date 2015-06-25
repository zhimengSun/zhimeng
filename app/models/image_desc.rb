class ImageDesc < ActiveRecord::Base
  scope :avilable, -> {where("photo_id > 24")}

  def picture
    Picture.where(bean_id: id, bean: "ImageDesc").last
  end

  def real_url
    OldWebHost + picture.file_path.to_s.split("public")[1] rescue nil 
  end
end
