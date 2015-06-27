class Tracker < ActiveRecord::Base
  belongs_to :ip
  
  def ip_address
    ip.name
  end

  def ip_location
    ip.location
  end
end
