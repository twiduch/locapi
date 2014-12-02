class Country < ActiveRecord::Base
  belongs_to :panel_provider
  has_many :location_groups, through: :panel_provider
  has_many :target_groups, through: :panel_provider
  has_many :locations,-> { uniq }, through: :location_groups
  
  validates :country_code, uniqueness: { case_sensitive: false }, presence: true
  before_save { self.country_code = country_code.downcase }
end
