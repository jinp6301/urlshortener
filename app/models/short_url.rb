class ShortURL < ActiveRecord::Base
  has_one :long_urls
  has_one :users

  def self.add_url(short_url, long_url_id, user_id)
    s = ShortURL.new
    s.short_url = short_url
    s.long_url_id = long_url_id
    s.user_id = user_id
    s.save
    s
  end

  def update_url(long_url_id)
    # self.short_url = short_url unless options['short_url'].nil?
 #    self.long_url_id = long_url_id unless options['long_url_id'].nil?
 #    self.user_id = user_id unless options['user_id'].nil?

    self.long_url_id = long_url_id
    self.save
  end

  def self.find_url(shortened)
    LongURL.find_by_id(ShortURL.find_by_short_url(shortened).long_url_id).long_url
  end


end