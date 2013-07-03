class Visit < ActiveRecord::Base
  has_many :short_urls

  def self.find_user(email)
    User.where(:email => email)
  end

  def self.add_user(email, username = nil)
    u = User.new
    u.email = email
    u.username = username
    u.save
    u
  end

end