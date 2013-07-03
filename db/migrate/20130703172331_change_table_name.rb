class ChangeTableName < ActiveRecord::Migration
  def change

    rename_table :visits_per_user, :visits_per_users

  end

end
