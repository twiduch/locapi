class AddSecretCodeToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :secret_code, :string
  end
end
