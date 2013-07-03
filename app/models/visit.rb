class Visit < ActiveRecord::Base

  def self.add_visit(short_url_id)
    x = Visit.find_by_short_url_id(short_url_id)
    if x.nil?
      y = Visit.new
      y.short_url_id = short_url_id
      y.unique = 1
      y.visit = 1
      y.save
    else
      x.visit += 1
      x.unique = Visit.unique_visits(short_url_id)
      x.save
    end
  end



  def self.unique_visits(short_url_id)
     VisitsPerUser.where('short_url_id' => short_url_id).group('user_id').length
   end

end