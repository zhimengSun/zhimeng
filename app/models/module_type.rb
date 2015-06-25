class ModuleType < ActiveRecord::Base
  scope :photos, -> {where(bean: "ImageDesc")}  
end
