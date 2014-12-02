module BasicInfo

  def locations
    @locations = country.try(:locations) || []
  end

  def target_groups
    @target_groups = root_target_groups.map(&:self_and_descendants).flatten
  end
  
  def country
    @country ||= Country.find_by_country_code(params[:country_code].downcase) 
  end
  
  def root_target_groups
    @root_target_groups ||= country.try(:target_groups) || []
  end

end
