class Country < ActiveRecord::Base
  belongs_to :panel_provider
  has_many :location_groups, through: :panel_provider
  has_many :target_groups, through: :panel_provider
  has_many :locations
  has_many :locations_in_groups,-> { uniq }, through: :location_groups, source: :locations
  
  validates :country_code, uniqueness: { case_sensitive: false }, presence: true
  before_save { self.country_code = country_code.downcase }
end
