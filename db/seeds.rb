PanelProvider.delete_all
PanelProvider.create([{code: 1, pricing: :letter_count}, 
                      {code: 2, pricing: :tag_count}, 
                      {code: 3, pricing: :node_count}])

Country.delete_all
Country.create([{country_code: 'UK', panel_provider: PanelProvider.first},
                {country_code: 'JP', panel_provider: PanelProvider.second},
                {country_code: 'SK', panel_provider: PanelProvider.third}])


#Generate 4 location groups and 4 root target groups
panels = PanelProvider.all.each
LocationGroup.delete_all
TargetGroup.delete_all
3.times do |i|
  panel = panels.next
  LocationGroup.create(name: "Location Group #{i+1}", panel_provider: panel)
  TargetGroup.create(name: "Root Target Group #{i+1}", uuid: SecureRandom.uuid,
                     panel_provider: panel, secret_code: "Secret #{i+1}")
end
LocationGroup.create(name: "Location Group 4", panel_provider: PanelProvider.first)
TargetGroup.create(name: "Root Target Group 4", uuid: SecureRandom.uuid,
                   panel_provider: PanelProvider.first, secret_code: "Secret 4")


#Create 20 locations
Location.delete_all
20.times do |i|
  country = Country.all[rand(Country.count)]
  Location.create(name: "Location #{i+1}", uuid: SecureRandom.uuid,
                  secret_code: "Secret #{i+1}", country: country)
end

#Connect locations to location_groups
LocationGroup.all.each do |lg|
  number = 1 + rand(20)
  number.times {lg.locations << Location.all[rand(20)]}
end

#Generate target groups tree with 3 levels deep
3.times do |generation|
  TargetGroup.find_all_by_generation(generation).each do |tg|
    child_number = 1 + rand(5)
    child_number.times do |i| 
      tg.children << TargetGroup.create(name: "Child Target Group #{tg.id} #{i+1}", 
                                        uuid: SecureRandom.uuid,
                                        secret_code: "Secret #{tg.id} #{i+1}")
    end
  end
end

