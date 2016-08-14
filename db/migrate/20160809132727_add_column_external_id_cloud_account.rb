class AddColumnExternalIdCloudAccount < ActiveRecord::Migration[5.0]
  def change
    add_column("cloud_accounts","external_id",:string)
  end
end
