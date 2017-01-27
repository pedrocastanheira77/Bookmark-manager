require 'data_mapper'
require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  property :id,              Serial
  property :email,           String
  property :password_digest, Text

  def password=(value)
    self.password_digest = BCrypt::Password.create(value)
  end

end
