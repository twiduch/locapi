class AddParentIdToTargetGroups < ActiveRecord::Migration
  def change
    add_column :target_groups, :parent_id, :integer
  end
end
