class AddCountryToLocations < ActiveRecord::Migration
  def change
    add_reference :locations, :country, index: true
  end
end
