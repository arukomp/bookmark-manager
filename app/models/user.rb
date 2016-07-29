require 'bcrypt'

class User
  attr_reader :password
  attr_accessor :password_confirmation

  include DataMapper::Resource

  property :id, Serial
  property :email, String, format: :email_address, required: true
  property :password_digest, String, length: 60
  validates_confirmation_of :password,
  :message => 'Password and confirmation password do not match'
  validates_uniqueness_of :email,
  :message => 'Email already registered'

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, pass)
    user = User.first(:email => email)
    if user && BCrypt::Password.new(user.password_digest) == pass
      user
    else
      nil
    end
  end

end
