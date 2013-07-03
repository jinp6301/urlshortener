class AddLongUrl < ActiveRecord::Migration
  def change
    change_table :long_urls do |t|
      t.string :long_url
      t.remove :short_url_id
    end
  end

end
