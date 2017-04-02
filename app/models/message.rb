class Message

  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :username, :content, :dialect

  validates_presence_of :content, :username, :dialect

  def dialect_icon
    case dialect
    when 'Yoda'
      'yoda-dialect-icon'
    when 'Valley Girl'
      'valley-girl-dialect-icon'
    when 'Binary'
      'binary-dialect-icon'
    else
      nil
    end
  end

end
