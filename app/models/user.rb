class User

  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :id, :username, :dialect

  validates_presence_of :username, :dialect

end
