class ImChannel < ActionCable::Channel::Base

  def subscribed
    stream_from "im_channel"
  end

  def unsubscribed
  end

end
