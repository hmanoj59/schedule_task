class DropTableSchedules < ActiveRecord::Migration[5.0]
  def change
    remove_column :schedules, :created_at, :datetime
    remove_column :schedules, :updated_at, :datetime
    drop_table :schedules
  end
end
