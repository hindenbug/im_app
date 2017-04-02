module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
      logger.add_tags current_user.username
    end

    def disconnect
    end

    protected

    def find_verified_user
      if current_user = User.new(id: cookies.signed[:user_id], username: cookies.signed[:username], dialect: cookies.signed[:dialect])
        current_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
