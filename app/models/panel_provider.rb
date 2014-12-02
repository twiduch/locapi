class PanelProvider < ActiveRecord::Base
  has_many :countries
  has_many :location_groups
  has_many :target_groups
  
  after_initialize :set_pricing_model
  validates :code, uniqueness: true, presence: true

  enum pricing: [:letter_count, :tag_count, :node_count]
  
  #to be able to change pricing model for panel dynamically
  attr_accessor :pricing_model
  
  def price
    pricing_model.price
  end
  
  def set_pricing_model
    self.pricing_model = PricingFactory.new(pricing).pricing
  end
end
