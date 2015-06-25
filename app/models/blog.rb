class Blog < ActiveRecord::Base

  belongs_to :category, class_name: "ModuleType"
  has_many :comments, class_name: "Message"

  validates :title, :content, presence: true
  default_scope {where("id != 1")}

  def tags
    WordTag.where("id in (#{self.tag_ids})") if self.tag_ids.presence
  end

  def keywords
    tags.collect{|wt| wt.name}.join(",") if tags
  end

  def post_time
    created_at.strftime("%F %T")
  end
  
end
