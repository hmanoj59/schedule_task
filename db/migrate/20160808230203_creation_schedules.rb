class CreationSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|


      t.timestamps
  end
  end
end

