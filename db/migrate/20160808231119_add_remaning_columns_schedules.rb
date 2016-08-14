class AddRemaningColumnsSchedules < ActiveRecord::Migration[5.0]
  def change
    add_column :schedules, :name, :string
    add_column :schedules, :remarks, :string
    add_column :schedules, :snapshotid, :string
    add_column :schedules, :snapshotname, :string
    add_column :schedules, :to_time, :time
    add_column :schedules, :enabled, :boolean
    add_column :schedules, :from_date, :date
    add_column :schedules, :repeat, :boolean
    add_column :schedules, :to_date, :date
    add_column :schedules, :occurs, :string
    add_column :schedules, :repeats_every_X_day, :integer
    add_column :schedules, :repeats_every_X_week, :integer
    add_column :schedules, :repeats_every_X_month, :integer
    add_column :schedules, :repeats_weekly_each_days_of_the_week_mask, :integer
    add_column :schedules, :repeats_monthly, :string
    add_column :schedules, :repeats_monthly_each_days_of_the_month_mask, :integer
    add_column :schedules, :repeats_monthly_on_ordinals_mask, :integer
    add_column :schedules, :repeats_monthly_on_days_of_the_week_mask, :integer
    add_column :schedules, :cloud, :string
    add_column :schedules, :region, :string
    add_column :schedules, :action, :string
    add_column :schedules, :instanceid, :string
    add_column :schedules, :from_time, :time
    add_column :schedules, :dat_tme, :datetime
    add_column :schedules, :timezone, :string
  end
end
