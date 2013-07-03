class AddTimestampToVisitsPerUser < ActiveRecord::Migration
  def change
    add_column :visits_per_users, :created_at, :datetime
    add_column :visits_per_users, :updated_at, :datetime
  end

end
