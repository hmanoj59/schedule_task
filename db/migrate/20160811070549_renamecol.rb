class Renamecol < ActiveRecord::Migration[5.0]
  def change
    rename_column :schedules, :repeats_every_X_day, :repeatdays
    rename_column :schedules, :repeats_every_X_week, :repeatweek
    rename_column :schedules, :repeats_weekly_each_days_of_the_week_mask, :weekdays
    rename_column :schedules, :repeats_every_X_month, :repeatmonth
    rename_column :schedules, :repeats_monthly_each_days_of_the_month_mask, :monthdays
  end
end
