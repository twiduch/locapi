class LocationGroup < ActiveRecord::Base
  belongs_to :panel_provider
  has_many :countries, through: :panel_provider
  has_and_belongs_to_many :locations, -> { uniq }
end
