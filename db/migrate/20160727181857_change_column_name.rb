class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :schedules, :dbinstanceid, :remarks
  end
end