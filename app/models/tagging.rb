class Tagging < ActiveRecord::Base

  def self.add_tagging(tag_id, short_url_id)
    t = Tagging.new
    t.tag_id = tag_id
    t.short_url_id = short_url_id
    t.save
  end

  def self.find_popular_by_tag

end