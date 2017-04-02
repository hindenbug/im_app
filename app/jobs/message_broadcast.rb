class MessageBroadcast < ApplicationJob
  queue_as :default

  def perform(message)
    message = Message.new(username: message[:username], content: message[:content], dialect: message[:dialect])

    ActionCable.server.broadcast('im_channel', {
      message: message.content, username: message.username,
      timestamp:  Time.now.strftime("%d-%m-%Y %H:%M %p"), dialect: message.dialect,
      dialect_icon: message.dialect_icon
    })
  end

end
