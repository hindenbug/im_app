class MessagesController < ApplicationController

  before_action :verify_user

  def index
  end

  def create
    content = Translator.new(params[:message][:content]).translate_to(params[:message][:dialect])
    MessageBroadcast.perform_later(username: current_user.username, content: content, dialect: current_user.dialect)
    head :ok
  end

  def dialect
    cookies.signed[:dialect] = params[:dialect]
    current_user.dialect = cookies.signed[:dialect]
  end

end
