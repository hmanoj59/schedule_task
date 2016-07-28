class AddRepeatsEveryNDaysToSchedules < ActiveRecord::Migration[5.0]
  def change
    add_column :schedules, :repeats_every_n_days, :integer
    add_column :schedules, :repeats_every_n_weeks, :integer
    add_column :schedules, :repeats_weekly_each_days_of_the_week_mask, :integer
    add_column :schedules, :repeats_every_n_months, :integer
    add_column :schedules, :repeats_monthly, :integer
    add_column :schedules, :repeats_monthly_each_days_of_the_month_mask, :integer
    add_column :schedules, :repeats_monthly_on_ordinals_mask, :integer
    add_column :schedules, :repeats_monthly_on_days_of_the_week_mask, :integer
    add_column :schedules, :repeats_every_n_years, :integer
    add_column :schedules, :repeats_yearly_each_months_of_the_year_mask, :integer
    add_column :schedules, :repeats_yearly_on, :integer
    add_column :schedules, :repeats_yearly_on_ordinals_mask, :integer
    add_column :schedules, :repeats_yearly_on_days_of_the_week_mask, :integer
  end
end
