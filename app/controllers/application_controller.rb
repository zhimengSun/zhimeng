class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :track_user

  private
    def udpate_show_times(obj)
      obj.transaction do
        obj.browse_times += 1
        obj.save
      end
    end

    def page_objs(objs, num = 10, pa = :page)
      return objs.page(params[pa]).per(num) if objs.is_a?(ActiveRecord::Relation)
      Kaminari.paginate_array(objs).page(params[pa]).per(num)
    end
  
    def track_user(f = "website")
      url = request.path + request.query_string 
      ip_address = Ip.find_or_create(name: request.remote_ip, location: get_ip_address)
      Tracker.create(user_agent: request.user_agent,web_url: url, data_from: f, ip_id: ip_address.id, host: request.host)
    end

    def get_ip_address
      IPParse.parse(request.ip)
    end
end
