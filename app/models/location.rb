class Location < ActiveRecord::Base
  has_and_belongs_to_many :location_groups, -> { uniq }
  
  default_scope {order(:id)}
end
