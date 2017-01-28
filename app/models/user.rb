require 'data_mapper'
require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource
  include BCrypt

  property :id,              Serial
  property :email,           String,  required: true,
                                      unique: true,
                                      format: :email_address,
                                      messages: {
                                        required: "An email address must be inserted.",
                                        is_unique: "The inserted email is already registered. Choose a different one.",
                                        format: "Doesn't look like an email address."
                                      }
  property :password_digest, Text

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password, confirm: :password_confirmation
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
end
