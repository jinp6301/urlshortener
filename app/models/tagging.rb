class Tagging < ActiveRecord::Base

  def self.add_tagging(tag_id, short_url_id)
    t = Tagging.new
    t.tag_id = tag_id
    t.short_url_id = short_url_id
    t.save
  end

  def self.find_popular_by_tag_id(tag_id)

    Tagging.find_by_sql("SELECT short_url_id, COUNT(short_url_id) FROM 'taggings' WHERE tag_id = #{tag_id} GROUP BY short_url_id ORDER BY COUNT(short_url_id) DESC LIMIT 1")[0].short_url_id
  end

end