class AddPricingToPanelProvider < ActiveRecord::Migration
  def change
    add_column :panel_providers, :pricing, :integer
  end
end
