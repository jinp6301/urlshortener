class Comment < ActiveRecord::Base
  belongs_to :short_urls
  belongs_to :users

  validates :comment, :presence => true

  def self.add_comment(comment, short_url_id, user_id)
    new_comment = Comment.new
    raise 'No comment given' if comment.nil?
    new_comment.comment = comment
    new_comment.short_url_id = short_url_id
    new_comment.user_id = user_id
    new_comment.save!
  end

  def self.show_comments(short_url_id)
    list_of_comments = Comment.find(:all, :conditions => ['short_url_id = ?', short_url_id])
    list_of_comments.each do |comment|
      puts comment.comment
    end
  end

end