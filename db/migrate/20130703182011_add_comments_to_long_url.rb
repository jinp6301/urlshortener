class AddCommentsToLongUrl < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment
      t.integer :short_url_id
      t.integer :user_id
    end
  end
end
