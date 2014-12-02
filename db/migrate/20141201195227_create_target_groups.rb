class CreateTargetGroups < ActiveRecord::Migration
  def change
    create_table :target_groups do |t|
      t.string :name
      t.string :uuid
      t.references :panel_provider, index: true

      t.timestamps
    end
  end
end
