class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

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
end
