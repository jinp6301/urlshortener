
class URLShortener

  attr_accessor :current_user

  def self.login(email, username)
    if User.find_by_email(email).nil?
      @current_user = User.add_user(email, username)
    else
      @current_user = User.find_by_email(email)
    end

  end

  def self.shorten(address=nil)
    raise 'No url given' if address.nil?
    @current_user.url_time
    short_url = SecureRandom.urlsafe_base64(6)
    ShortURL.add_url(short_url, LongURL.find_or_create(address), @current_user.id)
  end

  def self.expand(shortened)
    Comment.show_comments(ShortURL.find_by_short_url(shortened).id)

    Launchy.open(ShortURL.find_url(shortened))
    VisitsPerUser.add_visits_per_user(ShortURL.find_by_short_url(shortened).id, @current_user.id)
    Visit.add_visit(ShortURL.find_by_short_url(shortened).id)

  end

  def self.visits_since_10_mins(short_url)
    short_id = ShortURL.find_by_short_url(short_url).id
    VisitsPerUser.find(:all,
      :conditions => ['visits_per_users.created_at > ? AND short_url_id = ?',
      10.minutes.ago, short_id]).length
  end

  def self.add_comment(shortened)
    puts "comment:"
    comment = gets.chomp
    Comment.add_comment(comment, ShortURL.find_by_short_url(shortened).id, @current_user.id)

  end

  def self.add_tag(shortened)
    short_url_id = ShortURL.find_by_short_url(shortened).id
    puts "Choose which topic (number)"
    TagTopics.show_tag_topics
    tag_id = gets.chomp
    Tagging.add_tagging(tag_id, short_url_id)
  end

  def self.find_popular_by_tag
    TagTopics.show_tag_topics
    tag_id = gets.chomp
    ShortURL.find(Tagging.find_popular_by_tag_id(tag_id))
  end

end