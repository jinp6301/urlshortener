class AddVisit < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :visit
      t.integer :unique
      t.integer :short_url_id
    end
  end

end
