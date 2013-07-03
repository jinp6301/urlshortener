class AddLongUrl < ActiveRecord::Migration
  def change
    create_table :long_urls do |t|
      t.string :long_url
      t.integer :short_url_id
    end
  end

end
