class AddVisitPerUser < ActiveRecord::Migration
  def change
    create_table :visits_per_user do |t|
      t.integer :short_url_id
      t.integer :user_id
    end
  end

end
