class TagTopics < ActiveRecord::Base

  has_many :taggings

  def self.show_tag_topics
    TagTopics.find(:all).each do |tagtopic|
      print tagtopic.id
      print ':    '
      puts tagtopic.tag_topic
    end
  end


end