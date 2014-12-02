class TargetGroup < ActiveRecord::Base
  belongs_to :panel_provider
  has_many :countries, through: :panel_provider
  acts_as_tree
  
end
