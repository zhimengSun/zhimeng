#encoding utf-8
class Ip < ActiveRecord::Base
  has_many :trackers
  default_value_for :num, 0

  def self.find_or_create(option = {})
    ip_address = Ip.where(option).first_or_create
    ip_address.num += 1
    ip_address.save
    ip_address
  end

  def china_ip?
    Province.all.collect(&:name).each {|pn| return true if self.location =~ /#{pn}/ }
    false
  end
end
