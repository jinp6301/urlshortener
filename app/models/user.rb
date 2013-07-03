class User < ActiveRecord::Base
  has_many :short_urls
  has_many :visits_per_users

  validates :email, :uniqueness => true
  validates :email, :username, :presence => true

  validate :url_time


  def self.find_user(email)
    User.where(:email => email)
  end

  def self.add_user(email, username)
    u = User.new
    raise 'No email address given' if email.nil?
    u.email = email
    raise 'No username given' if username.nil?
    u.username = username
    raise 'email is not unique' unless u.save
    u
  end

  def all_short_urls
    ShortURL.find(:all, :conditions => ['user_id = ?', @id])
  end

  def url_time
    user_id = self.id
    submitted_url_count = VisitsPerUser.find(:all,
      :conditions => ['visits_per_users.created_at < ? AND user_id = ?',
      1.minutes.ago, user_id]).length
    if submitted_url_count > 5
      raise 'STOP SPAMMING'
    end

  end


end