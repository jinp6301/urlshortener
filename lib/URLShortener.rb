
class URLShortener

  attr_accessor :current_user

  def self.login(email, username = nil)
    if User.find_by_email(email).nil?
      @current_user = User.add_user(email, username)
    else
      @current_user = User.find_by_email(email)
    end

  end

  def self.shorten(address)
    short_url = SecureRandom.urlsafe_base64(6)
    ShortURL.add_url(short_url, LongURL.find_or_create(address), @current_user.id)
  end

  def self.expand(shortened)
    Launchy.open(ShortURL.find_url(shortened))

  end

end