class CreateCloudAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :cloud_accounts do |t|

      t.string "access_key_id"
      t.string "cloud_provider"
      t.string "name"
      t.string "iam_role_arn"
      t.string "secret_access_key"
      t.string "access_method"
      t.string "aws_cloud_partition"

      t.timestamps
    end
  end


end
