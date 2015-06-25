class WordTag < ActiveRecord::Base
  def blogs
    Blog.where("tag_ids is not null").select{|b| b.tags.include?(self)}
  end
end
