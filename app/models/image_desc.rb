class ImageDesc < ActiveRecord::Base
  scope :avilable, -> {where("photo_id > 24")}

  def picture
    Picture.where(bean_id: id, bean: "ImageDesc").last
  end

  def desc
    desc_zh_CN
  end

  def real_url
    WebHost + picture.file_path.to_s.split("public")[1] rescue nil 
  end
end
