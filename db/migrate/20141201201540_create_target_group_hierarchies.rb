class CreateTargetGroupHierarchies < ActiveRecord::Migration
  def change
    create_table :target_group_hierarchies, id: false do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
    end

    add_index :target_group_hierarchies, [:ancestor_id, :descendant_id, :generations],
      unique: true,
      name: "anc_desc_idx"

    add_index :target_group_hierarchies, [:descendant_id],
      name: "desc_idx"
  end
end
