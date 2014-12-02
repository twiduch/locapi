class AddSecretCodeToTargetGroups < ActiveRecord::Migration
  def change
    add_column :target_groups, :secret_code, :string
  end
end
