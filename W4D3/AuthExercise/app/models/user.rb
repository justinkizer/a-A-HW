class User < ActiveRecord::Base
  attr_reader :password
  before_validation :ensure_session_token

  validates :username, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: { message: "Password can't be blank" }
  validates :password, length: { minimum: 6, allow_nil: true }

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    digest = BCrypt::Password.new(user.password_digest)
    return user if user && digest.is_password?(password)
    nil
  end

  def reset_session_token!
    session_token = User.generate_session_token
    save!
    session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  private

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

end
