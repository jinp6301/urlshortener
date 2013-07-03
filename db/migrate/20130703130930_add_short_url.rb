class AddShortUrl < ActiveRecord::Migration
  def change
    create_table :short_urls do |t|
      t.string :short_url
      t.integer :long_url_id
      t.integer :user_id
    end
  end

end
