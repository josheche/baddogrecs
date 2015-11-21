class Message
  include ActiveModel::Model
  attr_accessor :name, :email, :subject, :content
end
