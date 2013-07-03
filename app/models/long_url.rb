class LongURL < ActiveRecord::Base
  has_many :short_urls
  has_one :users

  def self.add_url(address)
    s = LongURL.new
    s.long_url = address
    s.save
    s.id
  end

  def self.find_or_create(url)
    x = LongURL.find_by_long_url(url)
    if x.nil?
      self.add_url(url)
    else
      x.id
    end

  end

  # def update_url(options={})
  #   self.short_url = short_url unless options['short_url'].nil?
  #   self.long_url_id = long_url_id unless options['long_url_id'].nil?
  #   self.user_id = user_id unless options['user_id'].nil?
  # end



end