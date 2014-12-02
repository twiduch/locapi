class CreatePanelProviders < ActiveRecord::Migration
  def change
    create_table :panel_providers do |t|
      t.integer :code

      t.timestamps
    end
  end
end
